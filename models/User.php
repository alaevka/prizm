<?php
namespace app\models;
use yii\log\Logger;
use yii\behaviors\TimestampBehavior;
use dektrium\user\models\User as BaseUser;

class User extends BaseUser
{
    const ROLE_ORG_USER = 10;
    const ROLE_ORG_ADMIN = 20;
    const ROLE_ROOT = 30;

    public function behaviors()
    {
        return [
            'sammaye\audittrail\LoggableBehavior',
            TimestampBehavior::className(),
        ];
    }

    public function attributeLabels()
    {
        return [
            'username'          => 'Имя пользователя (логин)',
            'email'             => \Yii::t('user', 'Email'),
            'registration_ip'   => \Yii::t('user', 'Registration ip'),
            'unconfirmed_email' => \Yii::t('user', 'New email'),
            'password'          => \Yii::t('user', 'Password'),
            'created_at'        => \Yii::t('user', 'Registration time'),
            'confirmed_at'      => \Yii::t('user', 'Confirmation time'),
            'role'              => 'Роль пользователя',
            'created_by'        => 'Кем создан',
            'organization_id'        => 'Организация',
            'allow_alerts'      => 'Разрешить оповещения на email'
        ];
    }

    public function scenarios()
    {
        return [
            'register' => ['username', 'email', 'password'],
            'connect'  => ['username', 'email'],
            'create'   => ['username', 'email', 'password', 'role', 'organization_id', 'allow_alerts'],
            'update'   => ['username', 'email', 'password', 'role', 'organization_id', 'allow_alerts'],
            'settings' => ['username', 'email', 'password', 'allow_alerts']
        ];
    }

    public function rules()
    {
        return [
            // username rules
            'usernameRequired' => ['username', 'required', 'on' => ['register', 'connect', 'create', 'update']],
            'usernameMatch' => ['username', 'match', 'pattern' => '/^[-a-zA-Z0-9_\.@]+$/'],
            'usernameLength' => ['username', 'string', 'min' => 3, 'max' => 25],
            'usernameUnique' => ['username', 'unique'],
            'usernameTrim' => ['username', 'trim'],

            // email rules
            'emailRequired' => ['email', 'required', 'on' => ['register', 'connect', 'create', 'update']],
            'emailPattern' => ['email', 'email'],
            'emailLength' => ['email', 'string', 'max' => 255],
            'emailUnique' => ['email', 'unique'],
            'emailTrim' => ['email', 'trim'],

            // password rules
            'passwordRequired' => ['password', 'required', 'on' => ['register']],
            'passwordLength' => ['password', 'string', 'min' => 6, 'on' => ['register', 'create']],

             ['role', 'required'],
             ['created_by', 'required'],
             ['organization_id', 'required'],
             ['allow_alerts', 'safe']
        ];
    }

    public function getRole() {
        switch($this->role) {
            case 10: return 'Пользователь организации'; break;
            case 20: return 'Администратор организации'; break;
            case 30: return 'Root администратор'; break;
        }
    }

    public function create()
    {
        if ($this->getIsNewRecord() == false) {
            throw new \RuntimeException('Calling "' . __CLASS__ . '::' . __METHOD__ . '" on existing user');
        }

        $this->confirmed_at = time();

        if ($this->password == null) {
            $this->password = Password::generate(8);
        }
        
        if ($this->username === null) {
            $this->generateUsername();
        }

        $this->trigger(self::USER_CREATE_INIT);
        $this->created_by = \Yii::$app->user->identity->id;

        if ($this->save()) {
            $this->trigger(self::USER_CREATE_DONE);
            $this->mailer->sendWelcomeMessage($this);
            \Yii::getLogger()->log('User has been created', Logger::LEVEL_INFO);
            return true;
        }

        \Yii::getLogger()->log('An error occurred while creating user account', Logger::LEVEL_ERROR);

        return false;
    }
}