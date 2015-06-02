<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var backend\models\Programms $model
 * @var yii\widgets\ActiveForm $form
 */
?>

	<?php $form = ActiveForm::begin([
        'id' => 'organizations-form',
        'options' => ['class' => 'form-horizontal'],
        'fieldConfig' => [
        'template' => "{label}\n<div class=\"col-lg-10\">{input}</div>\n<div class=\"col-sm-offset-2 col-lg-10\">{error}\n{hint}</div>",
        'labelOptions' => ['class' => 'col-lg-2 control-label'],
        ],
    ]); ?>

    <?= $form->field($model, 'title', [
        'template' => "{label}<div class=\"col-sm-10\">{input}</div>\n{hint}\n<div class=\"col-sm-offset-2 col-lg-10\">{error}</div>", 
        'labelOptions'=>['class'=>'col-sm-2 control-label'],
        'inputOptions'=>['class'=>'form-control input-sm']
    ])->textInput(['autofocus' => true]) ?>
    <div class="hr-line-dashed"></div>

    <?= $form->field($model, 'address', [
        'template' => "{label}<div class=\"col-sm-10\">{input}</div>\n{hint}\n<div class=\"col-sm-offset-2 col-lg-10\">{error}</div>", 
        'labelOptions'=>['class'=>'col-sm-2 control-label'],
        'inputOptions'=>['class'=>'form-control input-sm']
    ])->textInput() ?>
    <div class="hr-line-dashed"></div>

    <?= $form->field($model, 'phone', [
        'template' => "{label}<div class=\"col-sm-10\">{input}</div>\n{hint}\n<div class=\"col-sm-offset-2 col-lg-10\">{error}</div>", 
        'labelOptions'=>['class'=>'col-sm-2 control-label'],
        'inputOptions'=>['class'=>'form-control input-sm']
    ])->textInput() ?>
    <div class="hr-line-dashed"></div>


    <div class="form-group">
        <div class="col-lg-offset-2 col-lg-10">
            <?= \yii\helpers\Html::submitButton($model->isNewRecord ? 'Добавить' : 'Изменить', ['class' => 'btn btn-success']) ?><br>
        </div>
    </div>	

    <?php ActiveForm::end(); ?>

</div>