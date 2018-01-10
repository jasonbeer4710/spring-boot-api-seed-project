/**
 *  全局函数对象   var blog = new $.blog();
 */
$.extend({
    blog: function () {
    }
});


/**
 * 成功弹框
 * @param options
 */
$.blog.prototype.alertOk = function (options) {
    options = options.length ? {text:options} : ( options || {} );
    options.title = options.title || '操作成功';
    // options.text = options.text;
    options.showCancelButton = false;
    options.showCloseButton = false;
    options.type = 'success';
    this.alertBox(options);
};

/**
 * 弹出成功，并在500毫秒后刷新页面
 * @param text
 */
$.blog.prototype.alertOkAndReload = function (text) {
    this.alertOk({text:text, then:function () {
        setTimeout(function () {
            window.location.reload();
        }, 500);
    }});
};

/**
 * 警告弹框
 * @param options
 */
$.blog.prototype.alertWarn = function (options) {
    options = options.length ? {text:options} : ( options || {} );
    options.title = options.title || '警告信息';
    // options.text = options.text;
    options.timer = 3000;
    options.type = 'warning';
    this.alertBox(options);
};

/**
 * 询问确认弹框，这里会传入then函数进来
 * @param options
 */
$.blog.prototype.alertConfirm = function (options) {
    options = options || {};
    options.title = options.title || '确定要删除吗？';
    // options.text = options.text;
    options.showCancelButton = true;
    options.type = 'question';
    this.alertBox(options);
};

/**
 * 错误提示
 * @param options
 */
$.blog.prototype.alertError = function (options) {
    options = options.length ? {text:options} : ( options || {} );
    options.title = options.title || '错误信息';
    // options.text = options.text;
    options.type = 'error';
    this.alertBox(options);
};

/**
 * 公共弹框
 * @param options
 */
$.blog.prototype.alertBox = function (options) {
    swal({
        title: options.title,
        text: options.text,
        type: options.type,
        timer: options.timer || 9999,
        showCloseButton: options.showCloseButton,
        showCancelButton: options.showCancelButton,
        showLoaderOnConfirm: options.showLoaderOnConfirm || false,
        confirmButtonColor: options.confirmButtonColor || '#3085d6',
        cancelButtonColor: options.cancelButtonColor || '#d33',
        confirmButtonText: options.confirmButtonText || '确定',
        cancelButtonText: options.cancelButtonText || '取消'
    }).then(function (e) {
        options.then && options.then(e);
    }).catch(swal.noop);
};

/**
 * 全局post函数
 *
 * @param options   参数
 */
$.blog.prototype.post = function (options) {
    var self = this;
    $.ajax({
        type: 'POST',
        url: options.url,
        data: options.data || {},
        async: options.async || false,
        dataType: 'json',
        success: function (result) {
            self.hideLoading();
            options.success && options.success(result);
        },
        error: function () {
            //
        }
    });
};

/**
 * 显示动画
 */
$.blog.prototype.showLoading = function () {
    if ($('#blog-loading').length == 0) {
        $('body').append('<div id="blog-loading"></div>');
    }
    $('#blog-loading').show();
};

/**
 * 隐藏动画
 */
$.blog.prototype.hideLoading = function () {
    $('#blog-loading') && $('#blog-loading').hide();
};