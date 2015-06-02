<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "objects".
 *
 * @property integer $id
 * @property string $title
 * @property string $address
 * @property integer $status
 * @property integer $organization_id
 */
class Objects extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'objects';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'address', 'organization_id'], 'required'],
            [['title', 'address'], 'string'],
            [['status', 'organization_id'], 'integer'],
            ['status', 'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Название объекта',
            'address' => 'Адрес объекта',
            'status' => 'Текущий статус',
            'organization_id' => 'Принадлежность к организации',
        ];
    }
}
