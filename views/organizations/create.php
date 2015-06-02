<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var backend\models\Programms $model
 */

$this->title = 'Пользователи и организации - Организации - Добавление организации';
$this->params['body_class'] = '';
?>
				<div class="row wrapper border-bottom white-bg page-heading">
                    <div class="col-lg-12">
                        <h2>Добавление организации</h2>
                        <ol class="breadcrumb">
                            <li>
                                <?= Html::a('Главная', ['/site/index']); ?>
                            </li>
                            <li>
                                Пользователи и организации
                            </li>
                            <li>
                                <?= Html::a('Организации', ['/organizations/index']); ?>
                            </li>
                            <li class="active"> 
                                <strong>Добавление организации</strong>
                            </li>
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <?= $this->render('_form', [
                				    'model' => $model,
                				]) ?>
                            </div>
                        </div>
                    </div>
                </div>
               