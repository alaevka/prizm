<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Objects;

/**
 * SearchOrganizations represents the model behind the search form about `\backend\models\Organizations`.
 */
class ObjectsSearch extends Objects
{
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['title', 'address', 'status', 'organization_id', 'device_id', 'phone'], 'safe'],
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = Objects::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if(\Yii::$app->user->identity->role != 30) {
            
            $query->andFilterWhere(['organization_id' => \Yii::$app->user->identity->organization_id]);
        }


        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title]);
        $query->andFilterWhere(['like', 'address', $this->address]);
        $query->andFilterWhere(['like', 'device_id', $this->device_id]);
        $query->andFilterWhere(['like', 'phone', $this->phone]);
        $query->andFilterWhere(['like', 'status', $this->status]);
        $query->andFilterWhere(['like', 'organization_id', $this->organization_id]);

        return $dataProvider;
    }
}
