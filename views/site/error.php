<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $name string */
/* @var $message string */
/* @var $exception Exception */

$this->title = $name;
$this->context->layout = 'empty';
?>
    <div class="middle-box text-center animated fadeInDown">
        <h1 style="font-size: 30px;"><?= Html::encode($this->title) ?></h1>
        <h3 class="font-bold"><?= nl2br(Html::encode($message)) ?></h3>

        <div class="error-desc">
            Извините, данная страница не найдена. Пожалуйста, проверьте правильность ввода адреса и попробуйте еще раз.
        </div>
        <div style="padding-top: 20px;">
            <?= Html::a('На главную', ['/'], ['tabindex' => '5']); ?>
        </div>
    </div>

