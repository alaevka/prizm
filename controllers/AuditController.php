<?php

namespace app\controllers;

use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * OrganizationsController implements the CRUD actions for Organizations model.
 */
class AuditController extends Controller
{
    
    public function actionIndex()
    {

        return $this->render('index', [
            
        ]);
    }
}