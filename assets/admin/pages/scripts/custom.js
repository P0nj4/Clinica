$(document).ready(function () {
    oTable = $('.turnDataTable').DataTable({
        "oLanguage": {
            "oPaginate": {
                "sFirst": "Primer página",
                "sLast": "Última página",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "sEmptyTable": "No hay información para mostrar",
            "sInfo": " Del _START_ al _END_ de un total de _TOTAL_ entradas",
            "sInfoEmpty": "No nada para mostrar",
            "sInfoFiltered": "- (Filtro sobre un total de _MAX_ entradas)",
            "sLengthMenu": "Mostrar de a _MENU_ entradas"
        }
    });
    $('#txtSearchField').keyup(function () {
        oTable.search($(this).val()).draw();
    })
});