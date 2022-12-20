// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-3.6.0
//= require popper.min
//= require bootstrap-5.0.2-dist/bootstrap
//= require bootstrap-5.0.2-dist/bootstrap.bundle
//= require bootstrap-table/bootstrap-table
//= require jquery-confirm-v3.3.4/jquery-confirm
//= require formatter
//= require_self
//= encoding UTF-8

/**
 * AJAX 觸發事件
 */
jQuery(document).off('click', 'button[data-dict="ajax"]');
jQuery(document).on('click','button[data-dict="ajax"]',function () {
    let url = this.dataset.url;
    let formId = this.dataset.formId;
    let data = jQuery(document.getElementById(formId)).serialize();
    let confirmMessage = this.dataset.confirm;

    if(confirmMessage){
        jQuery.confirm({
            theme: 'supervan',
            title: confirmMessage,
            buttons: {
                confirm: function () {
                    executeAjax(url,data);
                },
                cancel: function () {
                }
            }
        });
    }else{
        executeAjax(url,data);
    }



});


/**
 * 驅動 Ajax
 * @param data
 * @param url
 */
function executeAjax(url,data){
    jQuery.ajax({
        url: url,
        data: data,
        dataType: "json",
        success: function (json) {
            console.log(json);
        },
        error: function () {
            // endLoad();
            alert("發生錯誤。");
        }
    });
}