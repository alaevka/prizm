<?php
	use yii\helpers\ArrayHelper;
?>

<?= $form->field($model, 'title')->textInput() ?>
<?= $form->field($model, 'address')->textInput() ?>
<?= $form->field($model, 'organization_id')->dropDownList(Arrayhelper::map(app\models\Organizations::find()->orderBy('title')->all(), 'id', 'title')) ?>

