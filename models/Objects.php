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
    public function behaviors()
    {
        return [
            'sammaye\audittrail\LoggableBehavior'
        ];
    }
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
            [['title', 'address', 'organization_id', 'device_id'], 'required'],
            [['title', 'address'], 'string'],
            [['status', 'organization_id', 'message_error_delay', 'long_absence_communication', 'time_long_absence_communication'], 'integer'],
            [['status', 'phone', 'message_error_delay', 'long_absence_communication', 'time_long_absence_communication', 'password'], 'safe']
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
            'address' => 'Адрес объекта/описание',
            'status' => 'Текущий статус',
            'organization_id' => 'Принадлежность к организации',
            'device_id' => 'Идентификатор объекта',
            'phone' => 'Телефон',
            'message_error_delay' => 'Задержка сообщения об ошибке освещения, часов',
            'long_absence_communication' => 'Долгое отсутствие связи, часов',
            'time_long_absence_communication' => 'Время отсутствия связи, часов',
            'password' => 'Пароль (не используется)'
        ];
    }
}
