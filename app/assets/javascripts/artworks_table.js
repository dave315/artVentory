$('#artwork-table').dataTable( {
    stateSave: true,
    paging: true,
    ordering: true,
} );

$('#artwork-table tbody').on('click', 'tr', function () {
    var artworkId = $('td', this).eq(0).text();
    window.location.assign("/artworks/"+artworkId);

    if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }
} );
