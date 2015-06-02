<?php
namespace app\controllers\user;

use dektrium\user\Finder;
use app\models\User;
use dektrium\user\models\UserSearch;
use dektrium\user\Module;
use Yii;
use yii\base\ExitException;
use yii\base\Model;
use yii\base\Module as Module2;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\helpers\Url;
use app\filters\AccessRule;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\Response;
use yii\widgets\ActiveForm;
use dektrium\user\controllers\AdminController as BaseAdminController;

class AdminController extends BaseAdminController
{
   	public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete'  => ['post'],
                    'confirm' => ['post'],
                    'block'   => ['post']
                ],
            ],
            'access' => [
                'class' => AccessControl::className(),
                'ruleConfig' => [
                	'class' => AccessRule::className(),
                ],
                // 'rules' => [
                //     [
                //         'allow' => true,
                //         'roles' => ['@'],
                //         'matchCallback' => function () {
                //             return Yii::$app->user->identity->getIsAdmin();
                //         }
                //     ],
                // ]
                'only' => ['index','create', 'update', 'delete'],
                   'rules' => [
                       [
                           'actions' => ['index','create'],
                           'allow' => true,
                           // Allow users, moderators and admins to create
                           'roles' => [
                               User::ROLE_ORG_ADMIN,
                               User::ROLE_ROOT
                           ],
                       ],
                       [
                           'actions' => ['update', 'delete'],
                           'allow' => true,
                           // Allow moderators and admins to update
                           'roles' => [
                               User::ROLE_ORG_ADMIN,
                               User::ROLE_ROOT
                           ],
                       ],
                       
                   ],
            ]
        ];
    }

    public function actionIndex()
    {
        Url::remember('', 'actions-redirect');
        $searchModel  = Yii::createObject(UserSearch::className());
        $dataProvider = $searchModel->search(Yii::$app->request->get());

        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'searchModel'  => $searchModel,
        ]);
    }
}