<?php
use yii\helpers\Html;
use app\assets\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body class="top-navigation">

<?php $this->beginBody() ?>
    <div id="wrapper">
        <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom white-bg">
        <nav class="navbar navbar-static-top" role="navigation">
            <div class="navbar-header">
                <button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
                    <i class="fa fa-reorder"></i>
                </button>
                <a href="/" class="navbar-brand">prizm <sub style="font-size: 11px;">система мониторинга</sub></a>
            </div>
            <div class="navbar-collapse collapse" id="navbar">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a aria-expanded="false" role="button" href="/" style="color: #676a6c;"> Объекты мониторинга</a>
                    </li>
                    <?php if(Yii::$app->user->identity->role != 10) : ?>
                    <li class="dropdown">
                        <a aria-expanded="false" role="button" href="#" class="dropdown-toggle" data-toggle="dropdown"> Пользователи и организации <span class="caret"></span></a>
                        <ul role="menu" class="dropdown-menu">
                            <li><a href="/user/admin/index">Управление пользователями</a>
                            <?php if(Yii::$app->user->identity->role == 30) : ?>
                            <li><a href="/organizations/index">Управление организациями</a>
                            <?php endif; ?>    
                        </ul>
                    </li>
                    <?php endif; ?>    
                </ul>
                <ul class="nav navbar-top-links navbar-right">
                    <li><a href="/user/settings/account">Вы вошли как: <?= Yii::$app->user->identity->username; ?> (настройки)</a></li>
                    <li>
                        <?= Html::a('<i class="fa fa-sign-out"></i> Выйти', ['/user/security/logout'], ['data-method' => 'post']); ?>
                    </li>
                </ul>
            </div>
        </nav>
        </div>
        <div class="wrapper wrapper-content">
            <div class="container-fluid">
                <?= $content ?>
            </div>

        </div>
        <!-- <div class="footer">
            <div class="pull-right">
                10GB of <strong>250GB</strong> Free.
            </div>
            <div>
                <strong>Copyright</strong> Example Company &copy; 2014-2015
            </div>
        </div> -->

    </div>
</div>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>