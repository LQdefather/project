##front_end:

####App.vue:

The display of the main component, all other components is based on it.

####route/index.js:

导入 Vue 和 Vue Router 库。
使用 Vue.use() 安装 Vue Router 插件。
导入组件，这些组件将在不同的路由下使用。
定义一个路由配置数组 routes，其中每个路由对象包含 path、name 和 component 属性。
创建一个 VueRouter 实例，传入路由配置数组和其他选项（如 mode）。
导出创建的路由实例。
这段代码的作用是创建了一个 Vue Router 实例，并配置了不同路径下的路由和对应的组件。Vue Router 实例可以用于在 Vue 应用中实现页面的导航和路由跳转。

####MatchPage.vue:

模板部分：

使用了 template 标签定义组件的模板。
模板中包含了一个名为 "app" 的根元素，内部包含了其他的 HTML 元素和组件。
使用了条件渲染，通过 v-if="dataLoaded" 判断 dataLoaded 属性的值，如果为 true，则渲染包裹在 template 内部的内容。
使用了 Vue Router 的 router-view 组件，用于渲染匹配到的路由组件。
脚本部分：

使用了 import 语句导入了需要使用的组件和库。
在 data 中定义了组件的数据属性，包括 list、data、queue、offset、history 和 dataLoaded。
在 created 生命周期钩子中，调用了异步方法 loadData 和 mock 来加载数据和模拟数据。
定义了多个方法，用于处理用户交互事件和路由跳转。
使用 export default 导出了组件对象。
样式部分：

使用了 CSS 样式来定义组件的外观和布局。
这段代码实现了一个简单的 Vue 组件，包含了数据加载、条件渲染、路由跳转和用户交互等功能。通过对不同元素和组件的组合和交互，实现了一个类似 Tinder 的交互效果。

####ChatFeature:

上段代码是一个Vue组件，用于实现一个聊天界面。代码包含了HTML模板、JavaScript逻辑和CSS样式。

模板部分使用了Vue的模板语法，定义了聊天界面的结构。其中包括一个包含用户列表和消息列表的外层容器，用户列表显示了所有好友的头像、用户名和最新消息的数量，消息列表显示了与当前选中用户的对话记录。

JavaScript部分是Vue组件的定义，使用了axios库进行网络请求。组件的数据包括用户的ID、用户名、头像URL、好友列表数据、当前选中的用户、对话记录等。在组件的创建和销毁过程中，通过定时器定期从后端获取最新的消息数据，并更新到对应的数据结构中。另外，还定义了一些方法用于处理用户的交互行为，比如点击用户列表、发送消息、上传图片等。

CSS部分是组件的样式定义，使用了scoped属性使样式只在当前组件中生效。样式主要用于设置聊天界面的布局、背景颜色、字体颜色、头像大小等。

总体来说，这段代码实现了一个简单的聊天界面，可以显示用户的好友列表和与好友的对话记录，并支持发送文本消息和上传图片。

####others:

其他组件都是简单的界面，只有按钮，输入框等简单的元件，容易理解。

使用开发注意事项：

##back_end:

####InfoServiceImpl:

位于com.example.demo.service包下，命名为InfoServiceImpl。它是一个服务类，用于处理关于用户信息的业务逻辑。

代码中使用了一些依赖注入的注解，如@Autowired和@PostConstruct，用于自动注入依赖和在初始化时执行一些逻辑。

该类实现了InfoService接口，并重写了接口中定义的方法。这些方法包括：

updateInfo方法：用于更新学生的公共信息。通过调用publicInfoMapper的updateInfo方法来更新数据库中对应的信息。

getInfos方法：用于获取指定用户的信息列表。通过调用publicInfoMapper的getPair方法来从数据库中获取符合条件的信息列表。

addPrefer方法：用于添加用户之间的喜欢关系。通过调用publicInfoMapper的addLike方法来在数据库中添加喜欢关系，并返回相应的匹配结果。

deletePrefer方法：用于删除用户之间的喜欢关系。首先判断数据库中是否存在对应的喜欢关系，如果存在则返回false，否则调用publicInfoMapper的deleteLike方法删除对应的喜欢关系，并返回true。

getMyInfos方法：用于获取指定用户的个人信息。通过调用publicInfoMapper的getByName方法来从数据库中获取指定用户的个人信息。

其中，publicInfoMapper是一个接口类型的成员变量，通过依赖注入的方式进行实例化。在@PostConstruct注解的方法中，将publicInfoMapper2注入给publicInfoMapper，以便在类的其他方法中使用。

该类的主要功能是通过调用publicInfoMapper中定义的方法，与数据库进行交互，实现对用户信息的更新、查询和删除等操作。


####chat_service:
该接口包括以下方法：

updateInfo方法：用于更新学生的公共信息。接受一个Student_public对象作为参数，并返回一个Boolean值表示更新是否成功。

getInfos方法：用于获取指定用户的信息列表。接受一个int类型的user_name作为参数，并返回一个List<Student_public>对象，包含符合条件的信息列表。

addPrefer方法：用于添加用户之间的喜欢关系。接受两个int类型的user_name1和user_name2作为参数，以及一个int类型的prefer参数表示喜欢程度。返回一个String类型的结果。

getMyInfos方法：用于获取指定用户的个人信息。接受一个int类型的user_name作为参数，并返回一个Student_public对象，表示该用户的个人信息。

deletePrefer方法：用于删除用户之间的喜欢关系。接受一个friend_list对象作为参数，其中包含两个int类型的user_name1和user_name2。返回一个boolean值表示删除是否成功。

通过定义这些接口方法，可以在实现类中具体实现对用户信息的更新、查询和删除等操作。

####account_service:
位于com.example.demo.service包下，命名为accountServiceImpl。它实现了accountService接口，用于提供用户账户相关的服务。

该类包括以下成员：

accountMapper和publicInfoMapper：分别是AccountMapper和PublicInfoMapper类型的成员变量，用于操作账户和公共信息的数据访问对象。

accountMapper2和publicInfoMapper2：分别是AccountMapper和PublicInfoMapper类型的成员变量，通过@Autowired注解自动注入。

initAccount方法：使用@PostConstruct注解修饰的方法，用于在实例化后进行初始化操作，将accountMapper2赋值给accountMapper。

initPublicInfo方法：使用@PostConstruct注解修饰的方法，用于在实例化后进行初始化操作，将publicInfoMapper2赋值给publicInfoMapper。

loginCheck方法：实现了accountService接口中的登录验证方法。接受一个userid和password作为参数，将userid转换为int类型，然后使用accountMapper查询数据库获取用户账户信息，并使用publicInfoMapper查询数据库获取用户昵称。如果账户信息存在且密码匹配，则返回用户昵称；否则返回null。

register方法：实现了accountService接口中的注册方法。接受一个Student_account对象作为参数，首先使用accountMapper根据身份证号查询数据库检查账户是否已存在，如果存在则抛出自定义异常MyException。然后使用accountMapper根据邮箱查询数据库检查邮箱是否已存在，如果存在则抛出自定义异常MyException。最后通过accountMapper插入账户信息，并通过publicInfoMapper插入公共信息。返回一个Boolean值表示注册是否成功。

通过实现这些方法，accountServiceImpl类可以提供用户登录验证和注册

####domain:

承接数据库，存储了项目的所有信息

####accountCotroller：

它是一个控制器类，用于处理与用户账户相关的HTTP请求。

该类包括以下成员：

accountService：accountService接口类型的成员变量，用于调用账户相关的服务方法。

login方法：使用@PostMapping注解修饰的方法，用于处理登录请求。接受两个参数，userId和password，分别表示用户ID和密码。调用accountService的loginCheck方法进行登录验证，如果验证成功，则返回包含用户名的成功结果；否则返回登录错误的结果。

register方法：使用@PostMapping注解修饰的方法，用于处理注册请求。接受一个Student_account对象作为参数，表示要注册的学生账户信息。调用accountService的register方法进行注册，如果注册成功，则返回成功结果；否则返回其他错误的结果。

此外，该类还包括了一些注解：

@RestController：指示该类是一个RESTful风格的控制器。
@CrossOrigin：允许跨域请求。
@Validated：启用参数校验。
通过实现这些方法，accountControl类可以处理登录和注册的HTTP请求，并调用相应的服务方法进行处理。

####pairController：

位于com.example.demo.controller包下，命名为PairControl。它是一个控制器类，用于处理与用户配对相关的HTTP请求。

该类包括以下成员：

infoService：InfoService接口类型的成员变量，用于调用配对信息相关的服务方法。

getInfo方法：使用@GetMapping注解修饰的方法，用于根据用户ID获取配对信息。接受一个user_name作为路径变量，表示用户ID。调用infoService的getInfos方法，返回该用户的配对信息列表。

addPair方法：使用@PostMapping注解修饰的方法，用于添加配对信息。接受一个HasPair对象作为请求体，包含了要添加的配对信息。调用infoService的addPrefer方法进行添加，并根据返回结果决定是否添加好友关系。如果添加成功，还调用chatservice的addFriend方法添加好友关系，并返回"success"；否则返回"fail"。

deletePair方法：使用@PostMapping注解修饰的方法，用于删除配对信息。接受一个friend_list对象作为请求体，包含了要删除的配对信息。调用infoService的deletePrefer方法进行删除，并根据返回结果决定是否删除成功。

此外，该类还包括了一些注解：

@RestController：指示该类是一个RESTful风格的控制器。
@CrossOrigin：允许跨域请求。
@Validated：启用参数校验。
通过实现这些方法，PairControl类可以处理获取配对信息、添加配对信息和删除配对信息的HTTP请求，并调用相应的服务方法进行处理。

####infocontroller：

位于com.example.demo.controller包下，命名为InformationControl。它是一个控制器类，用于处理与用户信息相关的HTTP请求。

该类包括以下成员：

infoService：InfoService接口类型的成员变量，用于调用用户信息相关的服务方法。

getInfo方法：使用@GetMapping注解修饰的方法，用于根据用户ID获取用户信息。接受一个user_name作为路径变量，表示用户ID。调用infoService的getMyInfos方法，返回该用户的信息。

updateInfo方法：使用@PostMapping注解修饰的方法，用于更新用户信息。接受一个Student_public对象作为请求体，包含了要更新的用户信息。调用infoService的updateInfo方法进行更新。如果更新成功，返回成功的结果；否则抛出MyException异常，表示用户不存在。

此外，该类还包括了一些注解：

@RestController：指示该类是一个RESTful风格的控制器。
@CrossOrigin：允许跨域请求。
@Validated：启用参数校验。
通过实现这些方法，InformationControl类可以处理获取用户信息和更新用户信息的HTTP请求，并调用相应的服务方法进行处理。
