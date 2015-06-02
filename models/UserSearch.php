<?php
namespace app\models;
use dektrium\user\Finder;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use dektrium\user\models\UserSearch as BaseUserSearch;

class UserSearch extends BaseUserSearch
{

    public $created_by;
    public $role;

    public function rules()
    {
        return [
            'fieldsSafe' => [['username', 'email', 'registration_ip', 'created_at', 'created_by'], 'safe'],
            'createdDefault' => ['created_at', 'default', 'value' => null]
        ];
    }

    public function search($params)
    {
        $query = $this->finder->getUserQuery();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if(\Yii::$app->user->identity->role != 30) {
            $query->andFilterWhere(['created_by' => \Yii::$app->user->id]);
        }

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }
        
        if ($this->created_at !== null) {
            $date = strtotime($this->created_at);
            $query->andFilterWhere(['between', 'created_at', $date, $date + 3600 * 24]);
        }

        
        
        $query->andFilterWhere(['like', 'username', $this->username])
            ->andFilterWhere(['like', 'email', $this->email])
            //->andFilterWhere(['like', 'role', $this->role])
            ->andFilterWhere(['registration_ip' => $this->registration_ip]);

        return $dataProvider;
    }
}