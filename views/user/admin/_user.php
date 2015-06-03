<?php

/*
 * This file is part of the Dektrium project.
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

/**
 * @var yii\widgets\ActiveForm    $form
 * @var dektrium\user\models\User $user
 */
use yii\helpers\ArrayHelper;
?>

<?= $form->field($user, 'username')->textInput(['maxlength' => 25]) ?>
<?php if(Yii::$app->user->identity->role == 30) { ?>
	<?= $form->field($user, 'role')->dropDownList([10 => 'Пользователь организации', 20 => 'Администратор организации'],
	        ['prompt' => '...']
	) ?>
<?php } else { ?>
	<?= $form->field($user, 'role')->dropDownList([10 => 'Пользователь организации']) ?>
<?php } ?>
<?php
	if(\Yii::$app->user->identity->role != 30) {
	$current_user_organization_id = User::findOne(Yii::$app->user->id)->organization_id;
	$current_user_organization_title = Organizations::findOne($current_user_organization_id)->title;
?>
<?= $form->field($user, 'organization_id')->dropDownList([$current_user_organization_id => $current_user_organization_title]) ?>
<?php } else { ?>
<?= $form->field($user, 'organization_id')->dropDownList(Arrayhelper::map(app\models\Organizations::find()->orderBy('title')->all(), 'id', 'title')) ?>
<?php } ?>

<?= $form->field($user, 'email')->textInput(['maxlength' => 255]) ?>

<?= $form->field($user, 'allow_alerts')->checkbox() ?>

<?= $form->field($user, 'password')->passwordInput() ?>
