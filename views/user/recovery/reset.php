<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use dektrium\user\widgets\Connect;

$this->title = Yii::t('user', 'Sign in');
$this->params['breadcrumbs'][] = $this->title;

?>


    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">prizm</h1>

            </div>
            <br>
            <h3>Восстановление забытого пароля.</h3>
            <p>Пожалуйста, введите новый пароль.</p>
            <?php $form = ActiveForm::begin([
                    'id'                     => 'password-recovery-form',
                    'enableAjaxValidation'   => true,
                    'enableClientValidation' => false,
                    'options'                => ['class' => 'm-t']
                ]); ?>
                <div class="form-group">
                    <?= $form->field($model, 'password', ['inputOptions' => ['autofocus' => 'autofocus', 'class' => 'form-control', 'tabindex' => '1', 'placeholder' => 'Пароль']])->passwordInput()->label(false) ?>
                </div>

                <?= Html::submitButton(Yii::t('user', 'Finish'), ['class' => 'btn btn-primary block full-width m-b', 'tabindex' => '3']) ?>

                
            <?php ActiveForm::end(); ?>
           
        </div>
    </div>


