<?php
	use yii\helpers\ArrayHelper;
?>

<?= $form->field($model, 'title')->textInput() ?>
<?= $form->field($model, 'address')->textInput() ?>
<?= $form->field($model, 'organization_id')->dropDownList(Arrayhelper::map(app\models\Organizations::find()->orderBy('title')->all(), 'id', 'title')) ?>
<legend>Настройки объекта</legend>
<?= $form->field($model, 'device_id')->textInput() ?>
<?= $form->field($model, 'phone')->textInput() ?>
<?= $form->field($model, 'message_error_delay')->textInput() ?>
<?= $form->field($model, 'long_absence_communication')->textInput() ?>
<?= $form->field($model, 'time_long_absence_communication')->textInput() ?>
<hr>
<?= $form->field($model, 'password')->passwordInput(['disabled' => 'disabled']) ?>

