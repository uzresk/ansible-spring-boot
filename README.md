# ansible-spring-boot

ansibleでspring-bootのセットアップを行うplaybookとserverspecのテストコードです。

## 設定内容

* EPELの設定
* selinuxが有効になっているため、libselinux-pythonをインストール
* ユーザの作成
* ログ出力用のディレクトリを作成
* httpdのインストール / proxy設定 / サービス化
* jdkのインストール / パスの設定
* postgresqlのインストール / サービス化 / pg_hba.conf postgresql.confの最低限の設定

## 実行方法

1. git clone https://github.com/uzresk/ansible-spring-boot.git
2. vagrant upでcentos6.5 192.168.1.20が起動します。proxy配下で実行するときにはVagrantfileを修正してください。
3. ansibleでプロビジョニングします。spring-boot配下に移動して下記を実行  
` ansible-playbook -i hosts site.xml`
4. serverspecでテストを行います。 serverspec配下に移動して下記を実行  
` rake spec`
5. spring-boot用のjarを/home/cmp/app配下に配置し、/home/cmp/app/service.sh startでspring-bootアプリケーションが起動します。

## ansible 特定のroleだけ動かす方法

* roleごとにhttpd,jdk,postgresql,springbootのタグがつけてあります。実行するときには下記のように行います。  
`ansible-playbook -t [httpd|jdk|postgresql|springboot] -i hosts site.yml`
