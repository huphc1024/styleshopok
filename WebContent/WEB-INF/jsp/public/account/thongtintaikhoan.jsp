<div id="content" class="col-sm-9">      <h1>Thông tin tài khoản</h1>
      <form action="http://vinaenter.myzozo.net/index.php?route=account/edit" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend>Chi tiết tài khoản</legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-firstname">Họ & tên </label>
            <div class="col-sm-10">
              <input type="text" name="firstname" value="huu phuoc" placeholder="Họ & tên" id="input-firstname" class="form-control" />
                          </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-lastname">Tên</label>
            <div class="col-sm-10">
              <input type="text" name="lastname" value="le" placeholder="Tên" id="input-lastname" class="form-control" />
                          </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email">Email</label>
            <div class="col-sm-10">
              <input type="email" name="email" value="lehoaidang1024@gmail.com" placeholder="Email" id="input-email" class="form-control" />
                          </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-telephone">Điện thoại</label>
            <div class="col-sm-10">
              <input type="tel" name="telephone" value="01655669804" placeholder="Điện thoại" id="input-telephone" class="form-control" />
                          </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-fax">Fax</label>
            <div class="col-sm-10">
              <input type="text" name="fax" value="0985551" placeholder="Fax" id="input-fax" class="form-control" />
            </div>
          </div>
                                      </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="http://vinaenter.myzozo.net/index.php?route=account/account" class="btn btn-default">Quay lại</a></div>
          <div class="pull-right">
            <input type="submit" value="Tiếp tục" class="btn btn-primary" />
          </div>
        </div>
      </form>
      </div>
    </div>
</div>
<script type="text/javascript"><!--
// Sort the custom fields
$('.form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('.form-group').length) {
		$('.form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('.form-group').length) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('.form-group').length) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('.form-group').length) {
		$('.form-group:first').before(this);
	}
});
//--></script>
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});
//--></script>
