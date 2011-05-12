$(document).ready(function () {
    var tabs = [];
    var tabContainers = [];
    $('ul.tabs a').each(function () {
      // note that this only compares the pathname, not the entire url
      // which actually may be required for a more terse solution.
        if (this.pathname == window.location.pathname) {
            tabs.push(this);
            tabContainers.push($(this.hash).get(0));
        }
    });

    $(tabs).click(function () {
        // hide all tabs
        $(tabContainers).hide().filter(this.hash).show();

        // set up the selected class
        $(tabs).removeClass('selected');
        $(this).addClass('selected');

        return false;
    });
});