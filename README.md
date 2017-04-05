<h1> 第二遍购物网站</h1>
My JDStore's exercise for 2nd.
<!--- 任务1  --->
## 安装bootstrap
   ###### 将bootstrap的CSS套件装进专案
   ###### 修改全域HTML样式application.html.erb
   ###### 产生hello world页面
   ###### 增加flash功能
## 安装Devise
## 安装SimpleForm
## 安装font-awesome-rails
---
## 增加限制，只有admin才可以进入后台
---
## 实现了上传图片
>1. .gitignore
>2. 修改了new、edit.html.erb

# <b>1.页面前后台区别实现</b>
## 实现了前台的index、show

>1. navbar 添加 “products”

## 实现了后台的index、edit、new
## 管理员账户实现下拉后台进入“Admin选单”
---
# <b>2.购物车功能设计</b>
## 实现了购物车的前半部分，rails c的验证通过
---
## 消费者随时可以察看购物车的产品数量
---
## 按下购物车按钮时，看到了购物明细
---
## 购物车里，实现计算总价
---
## 实现清空购物车
---
## 实现在购物车里删除某一个商品
---
## 实现“加入购物车的商品不能重复添加”
---
## 实现“可以更改购物车了物品数量”
---
## 实现“购物车新增数量时，不能更新超过库存数量”
#<b>3.结账页面</b>
## step1. 建立checkout routing!
---
## step2.建立了order model
---
## step3.建立了checkout结账页面！
---
## step4.限制了必须填写下单人和收货人！
---
---
建立购买明细
## step1.建立了ProductList model
---
## step2.在订单建立后建立了购买明细缓存
---
## step3.建立了购买明细views
---
---
将网址改为秘密
## step1.在订单这个 model 里面加上一个栏位叫 token 存订单乱序号
---
## step2.revise model/order.rb
---
## step3.修改网址导向
### order_path(@order)--->order_path(@order.token) in create at orders_controller.rb
### order.find--->order.find_by_token in show at orders_controller.rb
---
---
下拉菜单可以看到我的所有订单
---
## step1, rails g controller account::orders
## step2, 修改routes.rb/修改controller，建立account/index.html.erb
## step3, rails c destroy_all because token!
## step4, DESC, 增加路径account_orders_path!
---
---
消费者可以针对订单结账
## step1: rails g migration add_is_paid_to_order将订单氛围已付款，未付款！
---
## step2: rails g migration add_payment_method_to_order记录订单付款方式
---
## step3: 在show页面加入结账按钮！<class="group pull-right">
---
## step4: 设定路径
---
## step5: 设定controller
---
## step6: 修改modle设定order付款完成与付款方式记录的method
---
## step7: 已经结账的订单不可再付款，修改show!
---
---
寄送订单确认通知信
## step1: 产生Mailer `rails g mailer OrderMailer`
---
## step2: 设定通知订单成立的寄信功能 <b>application_mailer.rb 与 order_mailer.rb的含义是什么？</b>
## touch 确认单>  为什么名字是 notify_order_placed.html.erb?
---
## step3: 安装gem letter_opener来预览邮件，需要设置开发者环境！
---
## step4: rails c  在 console 模式测试信件预览
---
## step5: 在订单建立时寄通知信，并清空购物车！！！不明白这个语句
<OrderMailer.notify_order_placed(@order).deliver!>
---
---
切换订单状态
## step1: AASM
---
## step2: 新增aasm_state 栏位。。。其实就是资料库db，问题——需要rails重启吗？
---
## step3: 设定订单状态机制---六个状态，已下订，已付款，出货中，到货，退货，取订。  event？
---
## step4: 用 AASM '的机制'设定订单付款. pay!中! ？
---
---
建立 admin/orders 可以看到系统内所有订单
## step1:建立 admin/orders 的 controller & views
<br>`rails g controller admin::orders`</br>
修改routes.rb</br>
修改admin/orders_controller.rb</br>
修改layouts/admin.html.erb</br>
`touch app/views/admin/orders/index.html.erb`</br>
修改it！git add .
---
## step2: 建立后台订单页面
---
CRUD</br>
设计show controller！
`touch app/views/admin/orders/show.html.erb`</br>
设计表单</br>
在helper里增加render_order_paid_state(order)method</br>
git add .</br>
---
## step3: 后台的订单可以依照“按照状态图”改变状态
修改路径 resources :orders => resources :orders do ...member do......post :cancel/ship/shipped/return...</br>
---
orders_controller.rb 安置cancel/ship/shipped/return的method
---
## Step 4: 新增异动订单状态的按钮
---
`touch app/views/admin/orders/_state_option.html.erb`
修改它
`app/views/admin/orders/show.html.erb` routes add
---
## Step 5: 用户取消订单
---
implement apply_to_cancel method in controllers/orders_controller.rb.
修改 routes.rb
修改订单页面，增加使用者申请取消订单按钮
`touch app/views/order_mailer/apply_cancel.html.erb`
---
---
## Step 6: 在出货/取消订单后，系统应该寄出通知信
---
增加 ship 和 cancel method里的 OrderMailer.notify_xx(@order).deliver!</br>
在`order_mailer.rb`新增 notify_ship 和 notify_cancel metod</br>
touch app/views/order_mailer/notify_cancel.html.erb
修改它！</br>
touch app/views/order_mailer/notify_ship.html.erb
修改它！</br>
----
