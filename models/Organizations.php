<?php

namespace app\models;

use Yii;
use yii\data\ActiveDataProvider;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "organizations".
 *
 * @property integer $id
 * @property string $title
 */
class Organizations extends ActiveRecord
{
    public function behaviors()
    {
        return [
            'timestamp' => [
                'class' => TimestampBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['created_at', 'updated_at'],
                    ActiveRecord::EVENT_BEFORE_UPDATE => 'updated_at',
                ],
            ],
            'sammaye\audittrail\LoggableBehavior'
        ];
    }

    public function getCreatedat()
    {
        return $this->created_at ? date('d-m-Y H:i:s', $this->created_at) : null;
    }

    public function getUpdatedat()
    {
        return $this->created_at ? date('d-m-Y H:i:s', $this->updated_at) : null;
    }
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'organizations';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title'], 'required'],
            [['title'], 'string'],
            [['created_at', 'updated_at', 'address', 'phone'], 'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Название организации',
            'created_at' => 'Дата создания',
            'updated_at' => 'Дата изменения',
            'address' => 'Юридический адрес',
            'phone' => 'Контактный телефон',
        ];
    }
}
