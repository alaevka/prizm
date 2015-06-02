<?php
use yii\helpers\Html;
use yii\grid\GridView;
use yii\web\View;
/**
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var backend\models\SearchOrganizations $searchModel
 */

$this->title = 'Пользователи и организации - Организации';
$this->params['body_class'] = '';
?>
                <div class="row wrapper border-bottom white-bg page-heading">
                    <div class="col-lg-12">
                        <h2>Организации <?= Html::a('<i class="fa fa-plus"></i> Добавить организацию', ['create'], ['class' => 'btn btn-primary pull-right']) ?></h2>
                        <ol class="breadcrumb">
                            <li>
                                <?= Html::a('Главная', ['/']); ?>
                            </li>
                            <li>
                                Пользователи и организации
                            </li>
                            <li class="active">
                                <strong>Организации</strong>
                            </li>
                        </ol>
                    </div>
                </div>

                <?= $this->render('@app/views/user/_alert', [
                    'module' => Yii::$app->getModule('user'),
                ]) ?>                
                                <?= GridView::widget([
                                    'dataProvider' => $dataProvider,
                                    'filterModel' => $searchModel,
                                    'options' => ['class'=>'ibox-content'],
                                    'tableOptions' => ['class'=>'table table-striped table-bordered table-hover dataTables-example'],
                                    'layout' => "<div class=\"pull-right\">{summary}</div>\n{items}\n{pager}",
                                    'columns' => [
                                        // ['class' => 'yii\grid\SerialColumn'],
                                        [
                                            'attribute' => 'title',
                                            
                                        ],
                                        [
                                            'attribute' => 'address',
                                            
                                        ],
                                        [
                                            'attribute' => 'phone',
                                            
                                        ],
                                            [
                                                'class' => 'yii\grid\ActionColumn',
                                                'template' => '{update} {delete}',
                                                'options' => ['style'=>'width: 80px;'],
                                                'buttons' => [
                                                    'update' => function ($url, $model) {
                                                        return Html::a('<i class="glyphicon glyphicon-wrench"></i>', $url, [
                                                            'class' => 'btn btn-xs btn-primary',
                                                            'title' => Yii::t('yii', 'Update'),
                                                        ]);
                                                    },
                                                    'delete' => function ($url, $model) {
                                                        return Html::a('<i class="glyphicon glyphicon-trash"></i>', $url, [
                                                            'class' => 'btn btn-xs btn-danger',
                                                            'data-method' => 'post',
                                                            'data-confirm' => 'Вы уверены, что хотите удалить этот элемент?',
                                                            'title' => Yii::t('yii', 'Delete'),
                                                        ]);
                                                    },
                                                ]
                                            ],
                                    ],
                                ]); ?>
                            