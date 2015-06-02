<?php
use yii\grid\GridView;
use app\models\Organizations;
use yii\helpers\ArrayHelper;
$this->title = 'Объекты мониторинга';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-12">
        <h2>Объекты мониторинга<a class="btn btn-primary pull-right" href="/site/create"><i class="fa fa-plus"></i> Добавить объект</a></h2>

        <ol class="breadcrumb">
            <li>
                <a href="/">Главная</a>
            </li>
            <li class="active">
                <strong>Объекты мониторинга</strong>
            </li>
        </ol>
    </div>
</div>
<?= $this->render('@app/views/user/_alert', [
    'module' => Yii::$app->getModule('user'),
]) ?>
<?= GridView::widget([
    'dataProvider' => $dataProvider,
    'filterModel'  => $searchModel,
    'layout'  => "{items}\n{pager}",
    'columns' => [
        'title',
        'address',
         [
            'attribute' => 'organization_id',
            'value' => function ($model) {
                    return Organizations::findOne($model->organization_id)->title;
                },
            'format' => 'html',
            'filter' => ArrayHelper::map(Organizations::find()->all(),'id','title')
        ],
        [
            'class' => 'yii\grid\ActionColumn',
            'template' => '{update} {delete}',
            'options' => ['style' => 'width: 50px;']
        ],
    ],
]); ?>
