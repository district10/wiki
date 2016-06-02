function panbookinit() {
    $('#panbookhome').click(function(){
        $('#panbookbody-github').load( "/fragments/index.html", panbookinit );
        $('#panbookbody-native').load( "/fragments/index.html", panbookinit );
    });
    $('.pblinks a, ul.pblinks li a').click(function(){
        var h5url = $(this).attr('href');
        var mdurl = h5url.replace('.html', '.md.html');
        $('#panbookbody-github').load( h5url, panbookinit );
        $('#panbookbody-native').load( mdurl, panbookinit );
        return false;
    });
    $('a').click(function(){
        if ( $(this).attr('href').contains('fragments/') ) {
            var h5url = $(this).attr('href');
            var mdurl = h5url.replace('.html', '.md.html');
            $('#panbookbody-github').load( h5url, panbookinit );
            $('#panbookbody-native').load( mdurl, panbookinit );
            return false;
        }
    });
}

$(function(){
    panbookinit();
    $("#tabNav ul").idTabs("tab1");
});
