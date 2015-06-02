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
            <h3>Система мониторинга состояния рекламных конструкций.</h3>
            <p>Пожалуйста, авторизуйтесь для продолжения.</p>
            <?php $form = ActiveForm::begin([
                    'id'                     => 'login-form',
                    'enableAjaxValidation'   => true,
                    'enableClientValidation' => false,
                    'validateOnBlur'         => false,
                    'validateOnType'         => false,
                    'validateOnChange'       => false,
                    'options'                => ['class' => 'm-t']
            ]) ?>
                <div class="form-group">
                    <?= $form->field($model, 'login', ['inputOptions' => ['autofocus' => 'autofocus', 'class' => 'form-control', 'tabindex' => '1', 'placeholder' => 'Логин']])->label(false) ?>
                </div>
                <div class="form-group">
                    <?= $form->field($model, 'password', ['inputOptions' => ['class' => 'form-control', 'tabindex' => '2', 'placeholder' => 'Пароль']])->passwordInput()->label(Yii::t('user', 'Password'))->label(false) ?>
                </div>

                <?= Html::submitButton(Yii::t('user', 'Sign in'), ['class' => 'btn btn-primary block full-width m-b', 'tabindex' => '3']) ?>

                <?= Html::a(Yii::t('user', 'Forgot password?'), ['/user/recovery/request'], ['tabindex' => '5']); ?>
                <hr>
                <?php if ($module->enableRegistration): ?>
                <?= Html::a(Yii::t('user', 'Don\'t have an account? Sign up!'), ['/user/registration/register'], ['class' => 'btn btn-sm btn-white btn-block']) ?>
                <?php endif ?>
            <?php ActiveForm::end(); ?>
            <p class="m-t"> <small>система принадлежит компании Брякина Алексея &copy; 2015</small> </p>
        </div>
    </div>


