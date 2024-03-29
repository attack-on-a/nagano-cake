# README

![logo](https://user-images.githubusercontent.com/122260585/227450985-32bf7af3-d4ae-4e5e-b839-49073bf64c5c.png)


## 概要
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト

(チーム開発の練習として作成してます)
## 簡単な説明
・サイトは顧客側(customer)と管理者側(admin)に分かれています

・管理者側は事前に設定したメールアドレスとパスワードでログインできるようにしており、ログイン後、顧客及び商品の編集ができます。

・顧客側は商品を選び購入できるようにしてます。支払いは、クレジットカード、銀行振り込みを選択できます。

・送料は1配送につき全国一律800円。消費税は10%となります。

## アプリケーション機能一覧
顧客と会員側で機能が分かれています。

**[会員側機能]**

・deviseを用いてログイン・ログアウトできます。メールアドレスとパスワードの入力でログインできます。

・ログイン後、会員情報の編集、商品購入、履歴表示、配送先の変更が行えます。

・商品はジャンル検索も行えます。

・支払いはクレジットカード、銀行振込が選べます。

・退会することができます。

**[管理者側機能]**

・注文履歴の確認ができ、製作中や発送準備中など、現状の変更を行い管理します。

・商品の登録ができ、販売中や販売停止の変更を行い注文できないようにしてます。

・会員一覧が確認でき、会員が退会しているなどの確認も行えます。

## 設計書

・[テーブル提議書.pdf](https://github.com/attack-on-a/nagano-cake/files/11059689/default.pdf)

・[ER図.pdf](https://github.com/attack-on-a/nagano-cake/files/11059722/ER.pdf)

・[アプリケーション詳細設計書.pdf](https://github.com/attack-on-a/nagano-cake/files/11059813/default.pdf)

## 使用したGem及びバージョン

・Rails : 6.1.7

・Devise : 4.9

・Bootstrap : 4.5

・Kaminari

・enum

## 担当
**[Team attack-on-a]**

・こってぃー

・しょう

・たけ

・むろ
