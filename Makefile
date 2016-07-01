.phony: pbindex
QiNiuAK:=$(QiNiuAK)
QiNiuSK:=$(QiNiuSK)

PUBDIR:=publish
FRAGDIR:=$(PUBDIR)/fragments
STATICSDIR:=statics
INDEX_SH:=$(STATICSDIR)/index.sh
INDEX_YAML:=index.yaml
PBINDEX_YAML:=$(FRAGDIR)/index.yaml
PBINDEX_PAGE:=$(FRAGDIR)/index.html
WIKI_TEMPLATE:=$(STATICSDIR)/wiki.template
INDEX_TEMPLATE:=$(STATICSDIR)/index.template
SRCMD:=$(wildcard *.md */*.md */*/*.md */*/*/*.md */*/*/*/*.md)
SRCMD:=$(filter-out $(PUBDIR)/%, $(SRCMD))
DSTMD:=$(addprefix $(PUBDIR)/, $(SRCMD))
HTMLS:=$(DSTMD:%.md=%.html)
FRAGS:=$(addprefix $(FRAGDIR)/, $(SRCMD))
FRAGS:=$(FRAGS:%.md=%.md.html) $(FRAGS:%.md=%.html)
STATICS:=$(wildcard $(STATICSDIR)/*/*.* $(STATICSDIR)/*/*/*.* $(STATICSDIR)/*/*/*/*.* $(STATICSDIR)/*/*/*/*/*.*)
PUBSTATICS:=$(STATICS:$(STATICSDIR)/%=$(PUBDIR)/%)

PANDOC_OPTIONS:=--ascii --mathjax -f markdown+abbreviations
ifeq (,$(DUMB))
	PANDOC_OPTIONS:=$(PANDOC_OPTIONS)+east_asian_line_breaks+emoji
endif

all: $(DSTMD) $(HTMLS) $(PUBSTATICS) $(FRAGS)
gh:
	git add -A; git commit -m "done"; git push
dumb:
	make -C .
clean:
	rm -rf $(PUBDIR)
serve:
	cd publish && python -m SimpleHTTPServer
qiniu:
	@cat conf.json.in \
		| sed -e "s/QiNiuAK/$(QiNiuAK)/" \
		| sed -e "s/QiNiuSK/$(QiNiuSK)/" \
		> conf.json && \
	qrsync conf.json

$(FRAGDIR)/%.html: $(PUBDIR)/%.md
	@mkdir -p $(@D)
	pandoc $(PANDOC_OPTIONS) $< -o $@
$(FRAGDIR)/%.md.html: $(PUBDIR)/%.md
	@mkdir -p $(@D)
	cat $(STATICSDIR)/wrap-a.txt $< $(STATICSDIR)/wrap-b.txt | \
	pandoc $(PANDOC_OPTIONS) -o $@

$(PUBDIR)/%.md: %.md
	@mkdir -p $(@D)
	cp $< $@
$(PUBDIR)/%.html: $(PUBDIR)/%.md
	@mkdir -p $(@D)
	pandoc $(PANDOC_OPTIONS) --template $(WIKI_TEMPLATE) $(INDEX_YAML) $< -o $@

$(PUBDIR)/%: $(STATICSDIR)/%
	@mkdir -p $(@D)
	cp $< $@

index:
	sh $(INDEX_SH) > $(PBINDEX_YAML) && \
	echo "## Wiki Index" | \
	pandoc $(PANDOC_OPTIONS) --template $(STATICSDIR)/index.template $(PBINDEX_YAML) > $(PBINDEX_PAGE)

EDITS = \
		src/meta/crude.md \
		src/meta/plans.md \
		src/github/index.md \

it:
	$(EDITOR) $(EDITS) 2>/dev/null &
