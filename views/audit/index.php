<?php
use yii\data\ActiveDataProvider;
use sammaye\audittrail\AuditTrail;
use app\models\User;
$this->title = 'Аудит работы с системой';

$criteria = AuditTrail::find();
$criteria->orderBy(['stamp' => SORT_DESC]);
?>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-12">
        <h2>Аудит работы с системой</h2>

        <ol class="breadcrumb">
            <li>
                <a href="/">Главная</a>
            </li>
            <li class="active">
                <strong>Аудит работы с системой</strong>
            </li>
        </ol>
    </div>
</div>
<?php
echo yii\grid\GridView::widget([
    'dataProvider' => new ActiveDataProvider([
        'query' => $criteria,
        'pagination' => [
            'pageSize' => 100,
        ]
    ]),
    'layout'  => "{items}\n{pager}",
    'columns' => [
        [
            'label' => 'Пользователь',
            'value' => function($model, $index, $widget){
                return User::findOne($model->user_id)->username;
            }
        ],
        [
            'label' => 'Модель',
            'attribute' => 'model',
            'value' => function($model, $index, $widget){
                $p = explode('\\', $model->model);
                return end($p);
            }
        ],
        [
            'label' => 'id',
            'attribute' => 'model_id'
        ],
        [
            'label' => 'Действие',
            'attribute' => 'action'
        ],
        [
            'label' => 'Поле',
            'value' => function($model, $index, $widget){
                return $model->getParent()->getAttributeLabel($model->field);
            }
        ],
        // [
        //     'label' => 'Старое значение',
        //     'attribute' => 'old_value',
        //     'contentOptions' => ['style' => 'width: 100px;']
        // ],
        // [
        //     'label' => 'Новое значение',
        //     'attribute' => 'new_value',
        //     'contentOptions' => ['style' => 'width: 100px;']
        // ],
        [
            'label' => 'Дата',
            'value' => function($model, $index, $widget){
                return date("d-m-Y H:i:s", strtotime($model->stamp));
            }
        ]
    ]
]); ?>