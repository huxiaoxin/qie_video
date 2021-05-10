//
//  AppDelegate+FilmMySafeApp.m
//  FilmFactory
//
//  Created by codehzx on 2021/4/25.
//

#import "AppDelegate+FilmMySafeApp.h"
#import "FilmFactortLoactionModel.h"
#import "FilmFactoryZoneModel.h"
#import <WHC_ModelSqliteKit-umbrella.h>
#import "FilmFactoryComentModel.h"
#import "FilmChatMsgListModel.h"
#import "FilmChatDetailMoel.h"
#import "FilmFacotryHomeModel.h"
#import "FilmFactoryShangyinModel.h"
@implementation AppDelegate (FilmMySafeApp)
+(void)load{
    [self FilmFacotryHomeModelConfig];
    [self FilmFactortLoactionModelConfig];
    [self FilmFactoryZoneModelConfig];
    [self FilmFactoryComentModelConfig];
    [self XiaoxinMsgListModelConfig];
    [self XYZLikeChatDetailMdoelConfig];
    [self FilmFactoryShangyinModelConfig];

}

+(void)FilmFactoryShangyinModelConfig{
    NSMutableArray * tempArr= [NSMutableArray array];
    [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://pic1.zhimg.com/v2-bb3442e46ea745f3725e171f05e2f8de_l.jpg?source=1940ef5c" FilmName:@"佛亦有刀" mytime:@"04-18 12:00:21" MyFilmID:0 MyComentID:0 CellHeight:0 myContent:@"千万别带脑袋去，有双眼睛和耳朵就够了。三四十块去消磨时间还是可以看看的。"]];

    [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://pic1.zhimg.com/v2-41928437e4a98c63d5583bfa07ecbd18_l.jpg?source=1940ef5c" FilmName:@"馬超" mytime:@"04-18 16:12:21" MyFilmID:0 MyComentID:1 CellHeight:0 myContent:@"我的青春啊~"]];

        [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://img3.doubanio.com/icon/up87002341-1.jpg" FilmName:@"越来越勇敢了" mytime:@"04-22 13:21:51" MyFilmID:1 MyComentID:2 CellHeight:0 myContent:@"只想知道最后有没有成为牺牲自我的伏地魔"]];


        [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://img9.doubanio.com/icon/u209329311-6.jpg" FilmName:@"再造一个新宇宙" mytime:@"04-18 10:26:32" MyFilmID:1 MyComentID:3 CellHeight:0 myContent:@"这是一部现实题材的亲情电影，生长在重男轻女的家庭，一个追求独立自我、拼尽全力想挣脱束缚的姐姐，在面对才四五岁的“拖油瓶”弟弟时，展现出内心矛盾与拉扯，自己的未来与亲情的纽带，都十分复杂和深刻。"]];

    
        [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://img2.doubanio.com/icon/u207606558-3.jpg" FilmName:@"筱兰的甜甜 " mytime:@"04-14 12:15:51" MyFilmID:2 MyComentID:4 CellHeight:0 myContent:@"《指环王2：双塔奇兵》在很好的继承了首部风格的基础上，更为庞大的史诗观，数条线索多线发展的电影格局在导演之手游刃有余，如果说《指环王》的首秀是开篇，终章是特效的盛宴，那么承上启下的《双塔奇兵》则是构筑了最为精彩的剧情。 "]];

    
        [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://pic2.zhimg.com/v2-da62d206a67afeaa9b5f8ea9da2ba3c5_l.jpg?source=1940ef5c" FilmName:@"耳东骏" mytime:@"04-15 16:33:24" MyFilmID:2 MyComentID:5 CellHeight:0 myContent:@"Jackson创造的中土世界以一种近乎真实的存在呈现在大家面前，多线的叙事利用传统蒙太奇的剪辑使每条主线的转换异常顺畅，本集中人物维度进一步丰满，一再被蛊惑心志的Frodo，严重分裂的咕噜，还有伟大的园丁Sam，他如是说There's"]];

    
        [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://pic4.zhimg.com/v2-a640e959b70077409299141a4b82df28_l.jpg?source=1940ef5c" FilmName:@"零度向前" mytime:@"04-21 18:24:11" MyFilmID:3 MyComentID:6 CellHeight:0 myContent:@"柯学已经下马，八百里狙击赤井秀一永远的神！柯学已经不足，全能大百科宫野志保永远的神！柯学已经不足，最强大脑的羽田秀吉永远的神！柯学已经不足，初中身体干翻秀一的玛丽永远的神！"]];

    
        [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://pic4.zhimg.com/v2-b7390daac1d6db4e447d2e57f9920237_l.jpg?source=1940ef5c" FilmName:@"令狐怕光" mytime:@"04-19 15:26:51" MyFilmID:4 MyComentID:7 CellHeight:0 myContent:@"那就是周显扬导演、杜致朗编剧、王凯、杨祐宁、古天乐、古力娜扎、韩庚等主演的《真三国无双》。"]];

        [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://pic1.zhimg.com/v2-5452844d19f796cccfcbb1be0a4f24f8_l.jpg?source=1940ef5c" FilmName:@"苏沉船" mytime:@"04-20 10:16:36" MyFilmID:4 MyComentID:8 CellHeight:0 myContent:@"看到周显扬我快笑死了，他拍的黄飞鸿英雄有梦是部无法形容的烂片……里面的台词确实有三国无双的中二风……"]];
    
        [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://pic1.zhimg.com/v2-4913281c3644c45ff54e6b0c440cf031_l.jpg?source=1940ef5c" FilmName:@"旧小鸽" mytime:@"04-16 12:24:17" MyFilmID:5 MyComentID:9 CellHeight:0 myContent:@"我觉得这部电影不应该叫《八月未央》，应该叫《小乔与未央》、或者叫《一个资深渣男引发的血案》。本年度最佳雷剧奖非它莫属。"]];
    
        [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://pic1.zhimg.com/v2-6d2f78388f2ec7e4e7406e92db700b8c_l.jpg?source=1940ef5c" FilmName:@"表姐电影" mytime:@"04-18 11:25:25" MyFilmID:5 MyComentID:10 CellHeight:0 myContent:@"这烂片我看吐了......朋友们，周末我去看了钟楚曦、罗晋和谭松韵主演的新片《八月未央》。"]];
    
    
        [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://pic4.zhimg.com/v2-4bcc284d174a3af92f619a2c3613a452_l.jpg?source=1940ef5c" FilmName:@"鹅鹅鹅" mytime:@"04-19 12:11:36" MyFilmID:6 MyComentID:11 CellHeight:0 myContent:@"疤面给人一种惊悚的感觉，其实这种可怖、迷幻的具象化，恰恰是梦的特征，因为梦就是跨越时空的，也是超越现实的。"]];
    
    
    
        [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://pic4.zhimg.com/v2-f46b8aa0f6bc647241570968b41f86f9_l.jpg?source=1940ef5c" FilmName:@"磕学家脆脆冰" mytime:@"04-22 10:25:31" MyFilmID:6 MyComentID:12 CellHeight:0 myContent:@"这部电影故事内核极其NB，电影想象力拉满，还引入了关于精神分析、心理学、讲了一个关于【梦中取物】的奇幻故事："]];


    
    
       [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://pic4.zhimg.com/v2-26467f46da7fd386d52b9a01dea0fc3b_l.jpg?source=1940ef5c" FilmName:@"大狸" mytime:@"04-20 12:11:36" MyFilmID:7 MyComentID:13 CellHeight:0 myContent:@"自《大圣归来》之后观众对孙悟空，哪吒等神话人物IP的审美疲劳已经到了一个即将爆发的点，但是其实《西游记之再世妖王》是继《大圣归来》之后，这五年里第二部以西游主题，孙悟空为主角的登上大荧幕的动画电影，也就是说，这些年动画电影并没有太多用西游IP来讲故事的，其他真人电影与网剧倒是有不少用了西游IP，所以才给观众留下了此IP出现如此频繁的印象。"]];

        [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://pic2.zhimg.com/v2-08ae149e7b1126dabd16efeb04ed3e10_l.jpg?source=1940ef5c" FilmName:@"杨建东" mytime:@"04-20 16:21:18" MyFilmID:7 MyComentID:14 CellHeight:0 myContent:@"前面孙悟空大闹五庄观的部分，因为前面太过遵守原著，反倒显得孙悟空有点蛮不讲理，作为一部商业电影，我觉得改编不够巧妙"]];
    
    
    [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://pic1.zhimg.com/v2-72c70b3d202f6508138766ab6ad4a080_l.jpg?source=1940ef5c" FilmName:@"泰勒太垃" mytime:@"04-21 15:17:21" MyFilmID:8 MyComentID:15 CellHeight:0 myContent:@"一艘被当时誉为“世上最豪华”的邮轮，泰坦尼克号，于1912年4月10日从英国南安普顿出发驶往美国纽约。所有人都说它“永不沉没”，然而它却永远的沉入在北大西洋冰冷的深海里，1517具亡灵随之而去..."]];

    
        [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://pic1.zhimg.com/v2-642b591aa4c9d5d00ef8f77bb856bfeb_l.jpg?source=1940ef5c" FilmName:@"导演罗飞" mytime:@"04-21 17:36:19" MyFilmID:8 MyComentID:16 CellHeight:0 myContent:@"Almost six years ago, my friend Steven Schwankert came to me and suggested that we make a documentary about the Chinese survivors of Titanic. “There were Chinese people on Titanic?!” was my immediate reaction. It’s a sentence I’ve heard a lot in the years since, pretty much every time we have told people about the film we are working on. And it is the fact that no one seemed to know about the Chinese on board the most famous shipwreck of all time that spurred us on to finish what at times seemed like an impossible task."]];

        [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://pic4.zhimg.com/v2-5d2d11b356a351dbeabedb44e19744c1_l.jpg?source=1940ef5c" FilmName:@"河东" mytime:@"04-21 18:14:21" MyFilmID:9 MyComentID:17 CellHeight:0 myContent:@"故事围绕冰雪世界里一场精彩的雪橇比赛展开，意外的失败发掘出了赛事背后的黑幕，弄虚作假、偷奸耍滑注定遭人唾弃，团结友爱、齐心协作才是正道。影片没有刻意说教，在诙谐幽默的气氛中让人不知不觉接受为人处世的正确态度，孩子的三观教育需要从小培养，建议家长带着小孩子一起来观看。充满正能量的片子还是太少了，这一部弥足珍贵！"]];
    
        [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://pic1.zhimg.com/v2-be6706884851de64f5f1c795018ebb88_l.jpg?source=1940ef5c" FilmName:@"舒心酱" mytime:@"04-24 12:56:21" MyFilmID:13 MyComentID:18 CellHeight:0 myContent:@"空王冠”之后，多米尼克·库克导演和本尼迪克特·康伯巴奇又合作了一部《信使》，不同于此前莎翁作品改编的理查三世、亨利六世等遥远故事，《信使》聚焦的是上个世纪中期的一场危机。"]];
    
        [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"https://pic2.zhimg.com/v2-f84f12436f2a8d8999c5757e5c07e210_l.jpg?source=1940ef5c" FilmName:@"Atlantis" mytime:@"04-21 15:21:56" MyFilmID:15 MyComentID:19 CellHeight:0 myContent:@"影片不是在讨论技术问题，而是创造这样情形来探讨人性问题，如果只能用个体的生命来保全群体的安危，那也许我们唯一能接受的就是这种在一同努力后最终不得已的个人牺牲，且必须是个体心甘情愿的付出，这是人性的最低底线，而群体中有没有甘愿牺牲的人，则就是这个群体的命运所在了。"]];


    
//
//    [tempArr addObject:[self FilmFactoryShangyinModelConfigWithImgUrl:@"" FilmName:@"" mytime:@"" MyFilmID:0 MyComentID:0 CellHeight:0 myContent:@""]];
    BOOL filmComentStatus = [[NSUserDefaults standardUserDefaults] boolForKey:@"FilmCpmentAdd"];
    if (filmComentStatus == NO) {
     BOOL isSucded =    [WHC_ModelSqlite inserts:tempArr.copy];
        [[NSUserDefaults standardUserDefaults] setBool:isSucded forKey:@"FilmCpmentAdd"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
   
}
+(FilmFactoryShangyinModel * )FilmFactoryShangyinModelConfigWithImgUrl:(NSString *)imgurl FilmName:(NSString *)name mytime:(NSString *)time MyFilmID:(NSInteger)FilmID MyComentID:(NSInteger)ComentID CellHeight:(CGFloat)cellheight myContent:(NSString *)content{
    FilmFactoryShangyinModel * shani =[[FilmFactoryShangyinModel alloc]init];
    shani.imgurl = imgurl;
    shani.name =  name;
    shani.time = time;
    shani.FilmID = FilmID;
    shani.ComentID = ComentID;
    shani.CellHeight = 0;
    shani.content = content;
    return shani;
}

+(void)FilmFacotryHomeModelConfig{
    NSMutableArray * tempArr = [NSMutableArray array];
    
    FilmFacotryHomeModel * FilmModel = [[FilmFacotryHomeModel alloc]init];
    FilmModel.total_Num = 5;
    FilmModel.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2021/0420/thumb_1_283_390_20210420020822855068.jpg";
    FilmModel.famous = @"速度与激情9";
    FilmModel.englishNae  =@"Fast & Furious 9";
    FilmModel.filmtype = @"动作/犯罪/冒险/美国 ";
    FilmModel.articlList = @"Vin Diesel/Tyrese Gibson/Lucas Black/John Cena";
    FilmModel.filmStar_five =0.6;
    FilmModel.filmStar_foure =0.4;
    FilmModel.filmStar_three =0.3;
    FilmModel.filmStar_two =0.1;
    FilmModel.filmStar_one =0.3;
    FilmModel.isColletcd = YES;
    FilmModel.ListArr = @[@{@"img":@"http://image11.m1905.cn/uploadfile/2013/1228/thumb_1_300_410_20131228103100376024.jpg",@"title":@"Vin Diesel"},@{@"img":@"http://image14.m1905.cn/uploadfile/2013/1228/thumb_1_300_410_20131228102405889151.jpg",@"title":@"Tyrese Gibson"},@{@"img":@"http://image14.m1905.cn/uploadfile/2013/0329/thumb_1_300_410_20130329062808553.jpg",@"title":@"Lucas Black"},@{@"img":@"http://image11.m1905.cn/mdb/uploadfile/2018/0104/thumb_1_300_410_20180104022954239793.jpg",@"title":@"John Cena"},@{@"img":@"http://pix2.tvzhe.com/thumb/character/445/431/140x190.jpg",@"title":@"莱蒂"},@{@"img":@"https://bkimg.cdn.bcebos.com/pic/cf1b9d16fdfaaf51904e979e865494eef01f7a65?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg",@"title":@"Sung Kang"},];
    FilmModel.intrduce = @"《速度与激情9》是《速度与激情》系列电影的第9部。是由美国环球影业发行，林诣彬执导，范·迪塞尔、泰瑞斯·吉布森、卢卡斯·布莱克等主演的动作片，该片于2019年11月宣布杀青。该片于2021年5月21日在中国上映 ，2021年6月25日在北美上映。";
    FilmModel.CoinNum = 23665;
    FilmModel.DoubanNum = 9.1;
    FilmModel.FilmID = 0;
    FilmModel.tagOne= @"动作";
    FilmModel.tagTwo = @"犯罪";
    FilmModel.time = @"2021-05-21";
    FilmModel.Top_filmType = 0;
    [tempArr addObject:FilmModel];
    

    FilmFacotryHomeModel * FilmModel1 = [[FilmFacotryHomeModel alloc]init];
    FilmModel1.total_Num = 3;
    FilmModel1.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2020/1231/thumb_1_283_390_20201231115721553976.jpg";
    FilmModel1.famous = @"我的姐姐";
    FilmModel1.englishNae  =@"my sister";
    FilmModel1.filmtype = @"剧情 家庭";
    FilmModel1.articlList = @"张子枫/肖央/朱媛媛/段博文/梁靖康";
    FilmModel1.filmStar_five =0.8;
    FilmModel1.filmStar_foure =0.3;
    FilmModel1.filmStar_three =0.5;
    FilmModel1.filmStar_two =0.2;
    FilmModel1.filmStar_one =0.1;
    FilmModel1.isColletcd = NO;
    FilmModel1.ListArr = @[@{@"img":@"http://image11.m1905.cn/mdb/uploadfile/2018/0211/thumb_1_300_410_20180211101201702178.jpg",@"title":@"张子枫"},@{@"img":@"http://image13.m1905.cn/mdb/uploadfile/2017/1107/thumb_1_300_410_20171107031733761669.jpg",@"title":@"肖央"},@{@"img":@"http://image11.m1905.cn/uploadfile/2013/0318/thumb_1_300_410_20130318034353287.jpg",@"title":@"朱媛媛"},@{@"img":@"http://image11.m1905.cn/mdb/uploadfile/2018/1225/thumb_1_300_410_20181225021958726499.jpg",@"title":@"梁靖康"},@{@"img":@"http://image13.m1905.cn/uploadfile/2013/0423/thumb_1_300_410_20130423125649994.jpg",@"title":@"段博文"}];
    FilmModel1.intrduce = @"《我的姐姐》围绕失去父母的姐姐在面对追求个人独立生活还是抚养弟弟的问题上展开了一段细腻感人的亲情故事。";
    FilmModel1.CoinNum = 6361;
    FilmModel1.DoubanNum = 6.4;
    FilmModel1.FilmID = 1;
    FilmModel1.tagOne= @"剧情";
    FilmModel1.tagTwo = @"家庭";
    FilmModel1.time = @"2021-04-02(内地)";
    FilmModel1.Top_filmType = 0;
    [tempArr addObject:FilmModel1];



    FilmFacotryHomeModel * FilmModel2 = [[FilmFacotryHomeModel alloc]init];
    FilmModel2.total_Num = 4;
    FilmModel2.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2021/0414/thumb_1_283_390_20210414021224519985.jpg";
    FilmModel2.famous = @"指环王：双塔奇兵";
    FilmModel2.englishNae  =@"The Lord of the Rings: The Two Towers";
    FilmModel2.filmtype = @"动作 剧情 冒险";
    FilmModel2.articlList = @"Elijah Wood/Sean Astin/Ian McKellen/Viggo Mortensen/Orlando Bloom";
    FilmModel2.filmStar_five =0.9;
    FilmModel2.filmStar_foure =0.5;
    FilmModel2.filmStar_three =0.3;
    FilmModel2.filmStar_two =0.2;
    FilmModel2.filmStar_one =0.1;
    FilmModel2.isColletcd = NO;
    FilmModel2.ListArr = @[@{@"img":@"http://image13.m1905.cn/uploadfile/2014/0928/thumb_1_300_410_20140928032408374984.jpg",@"title":@"Elijah Wood"},@{@"img":@"http://image14.m1905.cn/uploadfile/2012/0723/thumb_1_300_410_20120723030227155.jpg",@"title":@"Sean Astin"},@{@"img":@"http://image14.m1905.cn/uploadfile/2013/0218/thumb_1_300_410_20130218091636870.jpg",@"title":@"Ian McKellen"},@{@"img":@"http://image11.m1905.cn/uploadfile/2013/0219/thumb_1_300_410_20130219055302891.jpg",@"title":@"Viggo Mortensen"},@{@"img":@"http://image14.m1905.cn/uploadfile/2013/1128/thumb_1_300_410_20131128015840975684.jpg",@"title":@"Orlando Bloom"}];
    FilmModel2.intrduce = @"讲述护戒联盟中的哈比人梅利与皮平被奥克斯掳走，护戒使者们不得不分头行事：弗拉多与好友山姆继续向索隆领地莫都(Modor)进发，途中他们制服了也在疯狂寻找魔戒的怪物古鲁姆(Gollum)，魔戒曾经为他带来了长寿与隐身之道直到弗拉多的前辈毕尔博拿走了这枚戒指。由于通向莫都的路途十分艰险，而末日山就在莫都的北面，所以弗拉多与山姆不得不依靠古鲁姆的帮助。除了要时刻提防心怀鬼胎的古鲁姆，以及强大的魔戒幽灵，弗拉多还要抵御魔戒对其心灵愈来愈强的侵蚀，可谓生死一线，险情迭出…… 另一面护戒使者阿拉贡、莱格拉斯与吉穆利则与成功逃离奥克斯营地的梅利与皮平会合，并加入人类族群罗翰国(Rohan)的队伍准备对邪恶的白衣术士萨茹曼的领地伊森加德发动进攻。而此时黑魁首索隆也策动其奥克斯部队向罗翰的首都埃多拉斯进发，精灵族与人类的联盟将遭到黑魔法兽兵强大战斗力与萨茹曼邪恶魔法的双重挑战！紧要关头甘多夫再度现身，更从灰衣法师升至法力无边的白衣法师，双方一场恶战在所难免！";
    FilmModel2.CoinNum = 83192;
    FilmModel2.DoubanNum = 8.9;
    FilmModel2.FilmID = 2;
    FilmModel2.tagOne= @"动作";
    FilmModel2.tagTwo = @"剧情";
    FilmModel2.time = @"2021-04-23(内地)";
    FilmModel2.Top_filmType = 0;
    [tempArr addObject:FilmModel2];
    
    
    
    FilmFacotryHomeModel * FilmModel3 = [[FilmFacotryHomeModel alloc]init];
    FilmModel3.total_Num = 3;
    FilmModel3.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2021/0407/thumb_1_283_390_20210407110513749318.jpg";
    FilmModel3.famous = @"名侦探柯南：绯色的子弹";
    FilmModel3.englishNae  =@"名探偵コナン 緋色の弾丸";
    FilmModel3.filmtype = @"动画";
    FilmModel3.articlList = @"高山南/山崎和佳奈/小山力也/林原惠美/日高法子";
    FilmModel3.filmStar_five =0.6;
    FilmModel3.filmStar_foure =0.2;
    FilmModel3.filmStar_three =0.2;
    FilmModel3.filmStar_two =0.1;
    FilmModel3.filmStar_one =0.1;
    FilmModel3.isColletcd = NO;
    FilmModel3.ListArr = @[@{@"img":@"http://image13.m1905.cn/uploadfile/2012/0903/thumb_1_300_410_20120903033707293.jpg",@"title":@"高山南"},@{@"img":@"http://image11.m1905.cn/uploadfile/2013/0401/thumb_1_300_410_20130401022125828.jpg",@"title":@"山崎和佳奈"},@{@"img":@"http://image14.m1905.cn/uploadfile/2012/0903/thumb_1_300_410_20120903034345829.jpg",@"title":@"小山力也"},@{@"img":@"http://image14.m1905.cn/uploadfile/2013/0403/thumb_1_300_410_20130403121228363.jpg",@"title":@"林原惠美"},@{@"img":@"http://image13.m1905.cn/mdb/uploadfile/2016/0601/thumb_1_300_410_20160601033251547927.jpg",@"title":@"日高法子"}];
    FilmModel3.intrduce = @"在东京举办的世界级别的体育节「ワールドスポーツゲーム(WAG)」为此集结的人们……如此国际级别的活动却有事件发生的预感……";
    FilmModel3.CoinNum =68317;
    FilmModel3.DoubanNum = 6.4;
    FilmModel3.FilmID = 3;
    FilmModel3.tagOne= @"动画";
    FilmModel3.tagTwo = @"";
    FilmModel3.time = @"2021-04-17(内地)";
    FilmModel3.Top_filmType = 0;
    [tempArr addObject:FilmModel3];
    
    
    
    FilmFacotryHomeModel * FilmModel4 = [[FilmFacotryHomeModel alloc]init];
    FilmModel4.total_Num = 4;
    FilmModel4.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2021/0308/thumb_1_283_390_20210308105717998691.jpg";
    FilmModel4.famous = @"真·三国无双";
    FilmModel4.englishNae  =@"Dynasty Warriors ";
    FilmModel4.filmtype = @"爱情";
    FilmModel4.articlList = @"王凯/杨祐宁/古天乐/古力娜扎/韩庚";
    FilmModel4.filmStar_five =0.5;
    FilmModel4.filmStar_foure =0.4;
    FilmModel4.filmStar_three =0.1;
    FilmModel4.filmStar_two =0.1;
    FilmModel4.filmStar_one =0.1;
    FilmModel4.isColletcd = NO;
    FilmModel4.ListArr = @[@{@"img":@"http://image14.m1905.cn/mdb/uploadfile/2017/0927/thumb_1_300_410_20170927031056540057.jpg",@"title":@"王凯"},@{@"img":@"http://image14.m1905.cn/mdb/uploadfile/2017/1201/thumb_1_300_410_20171201023839888745.jpg",@"title":@"古天乐"},@{@"img":@"http://image14.m1905.cn/uploadfile/2013/0217/thumb_1_300_410_20130217022341451.jpg",@"title":@"杨祐宁"},@{@"img":@"http://image13.m1905.cn/mdb/uploadfile/2015/1214/thumb_1_300_410_20151214014729661602.jpg",@"title":@"古力娜扎"},@{@"img":@"http://image11.m1905.cn/mdb/uploadfile/2017/0927/thumb_1_168_230_20170927012428539069.jpg",@"title":@"韩庚"}];
    FilmModel4.intrduce = @"首次将《真.三国无双》电影化，该游戏系列的原作制作人铃木亮浩和日本光荣株式会社海外事业推进部部长小林英圣，特别到港公布开拍电影版的详情。而电影版则由《黄飞鸿之英雄有梦》导演周显扬执导及编剧杜致朗再次联手，打造全新三国时代。";
    FilmModel4.CoinNum = 2152;
    FilmModel4.DoubanNum = 6.9;
    FilmModel4.FilmID = 4;
    FilmModel4.tagOne= @"爱情";
    FilmModel4.tagTwo = @"";
    FilmModel4.time = @"2021-04-30(内地)";
    FilmModel4.Top_filmType = 0;
    [tempArr addObject:FilmModel4];
    
    
    FilmFacotryHomeModel * FilmModel5 = [[FilmFacotryHomeModel alloc]init];
    FilmModel5.total_Num = 2;
    FilmModel5.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2018/0126/thumb_1_283_390_20180126093725820782.jpg";
    FilmModel5.famous = @"八月未央";
    FilmModel5.englishNae  =@"August Weiyang";
    FilmModel5.filmtype = @"爱情";
    FilmModel5.articlList = @"谭松韵/钟楚曦/古天乐/古力娜扎/韩庚";
    FilmModel5.filmStar_five =0.5;
    FilmModel5.filmStar_foure =0.4;
    FilmModel5.filmStar_three =0.1;
    FilmModel5.filmStar_two =0.1;
    FilmModel5.filmStar_one =0.1;
    FilmModel5.isColletcd = NO;
    FilmModel5.ListArr = @[@{@"img":@"http://image13.m1905.cn/mdb/uploadfile/2017/1013/thumb_1_300_410_20171013112239153163.jpg",@"title":@"谭松韵"},@{@"img":@"http://image13.m1905.cn/mdb/uploadfile/2017/1211/thumb_1_300_410_20171211024333906246.jpg",@"title":@"钟楚曦"},@{@"img":@"http://image14.m1905.cn/mdb/uploadfile/2018/0126/thumb_1_300_410_20180126034442589864.jpg",@"title":@"罗晋"}];
    FilmModel5.intrduce = @"影片《八月未央》改编自安妮宝贝同名小说，讲述一对性格迥异的闺蜜知己——率真叛逆的未央和憧憬完美婚姻的乔，不约而同爱上了同一个男人朝颜的爱情故事。";
    FilmModel5.CoinNum = 31763;
    FilmModel5.DoubanNum = 6.9;
    FilmModel5.FilmID = 5;
    FilmModel5.tagOne= @"爱情";
    FilmModel5.tagTwo = @"";
    FilmModel5.time = @"2021-04-30(内地)";
    FilmModel5.Top_filmType = 0;
    [tempArr addObject:FilmModel5];
    
    
    FilmFacotryHomeModel * FilmModel6 = [[FilmFacotryHomeModel alloc]init];
    FilmModel6.total_Num = 4;
    FilmModel6.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2021/0322/thumb_1_283_390_20210322090623344611.jpg";
    FilmModel6.famous = @"超级的我";
    FilmModel6.englishNae  =@"Super Me";
    FilmModel6.filmtype = @"奇幻 冒险";
    FilmModel6.articlList = @"王大陆/宋佳/吴刚/金燕玲";
    FilmModel6.filmStar_five =0.6;
    FilmModel6.filmStar_foure =0.4;
    FilmModel6.filmStar_three =0.1;
    FilmModel6.filmStar_two =0.1;
    FilmModel6.filmStar_one =0.1;
    FilmModel6.isColletcd = NO;
    FilmModel6.ListArr = @[@{@"img":@"http://image11.m1905.cn/mdb/uploadfile/2017/1201/thumb_1_300_410_20171201022557304756.jpg",@"title":@"王大陆"},@{@"img":@"http://image13.m1905.cn/mdb/uploadfile/2018/0702/thumb_1_300_410_20180702042045133179.jpg",@"title":@"宋佳"},@{@"img":@"http://image14.m1905.cn/mdb/uploadfile/2019/0325/thumb_1_300_410_20190325112845998316.jpg",@"title":@"曹炳琨"},@{@"img":@"http://image14.m1905.cn/mdb/uploadfile/2017/1107/thumb_1_300_410_20171107105652402180.jpg",@"title":@"吴刚"},@{@"img":@"http://image14.m1905.cn/mdb/uploadfile/2019/0618/thumb_1_300_410_20190618111500880587.jpg",@"title":@"金燕玲"}];
    FilmModel6.intrduce = @"18线小编剧桑榆（王大陆 饰）原本生活困顿拮据，但一夜之间却拥有了梦中取物的神奇能力，通过将梦中的宝物变现，潦倒落魄的他成为人生赢家，甚至一掷千金追求到暗恋多年的花儿（宋佳 饰），然而在梦中快意掠取的桑榆却逐渐发现，这场躺赢美梦竟将他的生活推向了失控的边缘……";
    FilmModel6.CoinNum = 21312;
    FilmModel6.DoubanNum = 5.3;
    FilmModel6.FilmID = 6;
    FilmModel6.tagOne= @"奇幻";
    FilmModel6.tagTwo = @"冒险";
    FilmModel6.time = @"2021-04-09(内地)";
    FilmModel6.Top_filmType = 0;
    [tempArr addObject:FilmModel6];
    
    
    FilmFacotryHomeModel * FilmModel7 = [[FilmFacotryHomeModel alloc]init];
    FilmModel7.total_Num = 5;
    FilmModel7.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2021/0219/thumb_1_230_307_20210219092618173678.jpg";
    FilmModel7.famous = @"西游记之再世妖王 ";
    FilmModel7.englishNae  =@"Monkey King Reborn";
    FilmModel7.filmtype = @"动画";
    FilmModel7.articlList = @"边江/张磊/苏尚卿/张赫";
    FilmModel7.filmStar_five =0.4;
    FilmModel7.filmStar_foure =0.2;
    FilmModel7.filmStar_three =0.1;
    FilmModel7.filmStar_two =0.1;
    FilmModel7.filmStar_one =0.1;
    FilmModel7.isColletcd = NO;
    FilmModel7.ListArr = @[@{@"img":@"http://image11.m1905.cn/mdb/uploadfile/2021/0305/thumb_1_300_410_20210305094536308320.jpg",@"title":@"边江"},@{@"img":@"http://image14.m1905.cn/mdb/uploadfile/2018/0727/thumb_1_300_410_20180727021730541339.jpg",@"title":@"张磊"},@{@"img":@"http://image11.m1905.cn/mdb/uploadfile/2018/1224/thumb_1_300_410_20181224043647334765.jpg",@"title":@"苏尚卿"},@{@"img":@"http://image13.m1905.cn/mdb/uploadfile/2020/1224/thumb_1_300_410_20201224085024939210.jpg",@"title":@"张赫"}];
    FilmModel7.intrduce = @"混沌初开之时，世上的第一只妖降世，名元蒂，被奉为妖祖。千百万年后，昔日妖王孙悟空被唐僧从五行山下救出，悟空答应保护唐僧，前往西天取经。而传说中的妖祖元蒂再次现世，三界岌岌可危。两代妖王注定终极一战，但这次，孙悟空遇上了真正的劲敌。";
    FilmModel7.CoinNum = 3128;
    FilmModel7.DoubanNum = 4.2;
    FilmModel7.FilmID = 7;
    FilmModel7.tagOne= @"动画";
    FilmModel7.tagTwo = @"";
    FilmModel7.time = @"2021-04-02(内地)";
    FilmModel7.Top_filmType = 0;
    [tempArr addObject:FilmModel7];
    
    //
    FilmFacotryHomeModel * FilmModel8 = [[FilmFacotryHomeModel alloc]init];
    FilmModel8.total_Num = 3;
    FilmModel8.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2021/0318/thumb_1_283_390_20210318101444994601.jpg";
    FilmModel8.famous = @"六人-泰坦尼克上的中国幸存者 ";
    FilmModel8.englishNae  =@"The Six";
    FilmModel8.filmtype = @"动画";
    FilmModel8.articlList = @"施万克";
    FilmModel8.filmStar_five =0.2;
    FilmModel8.filmStar_foure =0.2;
    FilmModel8.filmStar_three =0.1;
    FilmModel8.filmStar_two =0.1;
    FilmModel8.filmStar_one =0.1;
    FilmModel8.isColletcd = NO;
    FilmModel8.ListArr = @[@{@"img":@"http://image11.m1905.cn/mdb/uploadfile/2020/0117/thumb_1_300_410_20200117094232259181.jpg",@"title":@"施万克"}];
    FilmModel8.intrduce = @"由詹姆斯·卡梅隆监制的纪录片《六人-泰坦尼克上的中国幸存者》还原于1912年4月14日沉没的泰坦尼克号上，六个被遗忘的中国人的逃生经历、追寻他们的人生轨迹，揭示被掩盖一个世纪之久的真相。";
    FilmModel8.CoinNum = 3131;
    FilmModel8.DoubanNum = 3.1;
    FilmModel8.FilmID = 8;
    FilmModel8.tagOne= @"动画";
    FilmModel8.tagTwo = @"";
    FilmModel8.time = @"2021-04-16(内地)";
    FilmModel8.Top_filmType = 0;
    [tempArr addObject:FilmModel8];
    
    FilmFacotryHomeModel * FilmModel9 = [[FilmFacotryHomeModel alloc]init];
    FilmModel9.total_Num = 4;
    FilmModel9.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2021/0419/thumb_1_283_390_20210419101632664004.jpg";
    FilmModel9.famous = @"冰雪大作战2";
    FilmModel9.englishNae  =@"Racetime";
    FilmModel9.filmtype = @"动画 喜剧 冒险";
    FilmModel9.articlList = @"施万克";
    FilmModel9.filmStar_five =0.6;
    FilmModel9.filmStar_foure =0.4;
    FilmModel9.filmStar_three =0.3;
    FilmModel9.filmStar_two =0.2;
    FilmModel9.filmStar_one =0.1;
    FilmModel9.isColletcd = NO;
    FilmModel9.ListArr = @[@{@"img":@"http://image11.m1905.cn/mdb/uploadfile/2020/0117/thumb_1_300_410_20200117094232259181.jpg",@"title":@"施万克"}];
    FilmModel9.intrduce = @"续作延续前一部的风格，讲述在这座加拿大小镇上，开展了一场盛大的雪橇比赛，弗兰基带着他的团队参赛，而索菲亚则担任舵手，除此之外，还有新的成员加入了这场比赛，包括神秘而自负的扎克、以及扎克的运动员表姐查莉....";
    FilmModel9.CoinNum = 4241;
    FilmModel9.DoubanNum = 5.7;
    FilmModel9.FilmID = 9;
    FilmModel9.tagOne= @"动画";
    FilmModel9.tagTwo = @"喜剧";
    FilmModel9.time = @"2021-04-30(内地)";
    FilmModel9.Top_filmType = 0;
    [tempArr addObject:FilmModel9];
    
    
    
    
    
    FilmFacotryHomeModel * FilmModel10 = [[FilmFacotryHomeModel alloc]init];
    FilmModel10.total_Num = 3;
    FilmModel10.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2021/0122/thumb_1_283_390_20210122021918487741.jpg";
    FilmModel10.famous = @"真人快打";
    FilmModel10.englishNae  =@"Mortal Kombat";
    FilmModel10.filmtype = @"动作 冒险 奇幻";
    FilmModel10.articlList = @"浅野忠信/刘易斯·谭/真田广之";
    FilmModel10.filmStar_five =0.7;
    FilmModel10.filmStar_foure =0.3;
    FilmModel10.filmStar_three =0.2;
    FilmModel10.filmStar_two =0.1;
    FilmModel10.filmStar_one =0.1;
    FilmModel10.isColletcd = NO;
    FilmModel10.ListArr = @[@{@"img":@"http://image11.m1905.cn/mdb/uploadfile/2017/0606/thumb_1_300_410_20170606110256889087.jpg",@"title":@"浅野忠信"},@{@"img":@"http://image13.m1905.cn/mdb/uploadfile/2018/0129/thumb_1_300_410_20180129110448341582.jpg",@"title":@"刘易斯·谭"},@{@"img":@"http://image14.m1905.cn/mdb/uploadfile/2017/0526/thumb_1_300_410_20170526045048720441.jpg",@"title":@"真田广之"}];
    FilmModel10.intrduce = @"续作延续前一部的风格，讲述在这座加拿大小镇上，开展了一场盛大的雪橇比赛，弗兰基带着他的团队参赛，而索菲亚则担任舵手，除此之外，还有新的成员加入了这场比赛，包括神秘而自负的扎克、以及扎克的运动员表姐查莉....";
    FilmModel10.CoinNum = 2161;
    FilmModel10.DoubanNum = 8.2;
    FilmModel10.FilmID = 10;
    FilmModel10.tagOne= @"动画";
    FilmModel10.tagTwo = @"喜剧";
    FilmModel10.time = @"2021-04-23(美国)";
    FilmModel10.Top_filmType = 1;
    [tempArr addObject:FilmModel10];
    
    
    FilmFacotryHomeModel * FilmModel11 = [[FilmFacotryHomeModel alloc]init];
    FilmModel11.total_Num = 4;
    FilmModel11.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2021/0312/thumb_1_283_390_20210312014243270403.jpg";
    FilmModel11.famous = @"星期一";
    FilmModel11.englishNae  =@"Monday";
    FilmModel11.filmtype = @"剧情 爱情";
    FilmModel11.articlList = @"塞巴斯蒂安·斯坦/范杰利斯·莫里基斯";
    FilmModel11.filmStar_five =0.6;
    FilmModel11.filmStar_foure =0.4;
    FilmModel11.filmStar_three =0.1;
    FilmModel11.filmStar_two =0.2;
    FilmModel11.filmStar_one =0.2;
    FilmModel11.isColletcd = NO;
    FilmModel11.ListArr = @[@{@"img":@"http://image14.m1905.cn/uploadfile/2013/1228/thumb_1_300_410_20131228110430861269.jpg",@"title":@"塞巴斯蒂安·斯坦"},@{@"img":@"http://image14.m1905.cn/uploadfile/2014/0212/thumb_1_300_410_20140212022053914159.jpg",@"title":@"范杰利斯·莫里基斯"}];
    FilmModel11.intrduce = @"本片讲述两个自毁倾向的美国人Mickey和Chloe，住在雅典和希腊群岛之间，发展出了海啸般的恋爱，据称是一段“现代人似乎已不再热衷”的“热烈的恋情”，但会让每个人有共鸣。";
    FilmModel11.CoinNum = 3127;
    FilmModel11.DoubanNum = 6.4;
    FilmModel11.FilmID = 11;
    FilmModel11.tagOne= @"剧情";
    FilmModel11.tagTwo = @"爱情";
    FilmModel11.time = @"2021-04-16(美国)";
    FilmModel11.Top_filmType = 1;
    [tempArr addObject:FilmModel11];
    
    
    FilmFacotryHomeModel * FilmModel12 = [[FilmFacotryHomeModel alloc]init];
    FilmModel12.total_Num = 3;
    FilmModel12.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2021/0108/thumb_1_283_390_20210108012525840951.jpg";
    FilmModel12.famous = @"椿之庭";
    FilmModel12.englishNae  =@"椿の庭";
    FilmModel12.filmtype = @"剧情";
    FilmModel12.articlList = @"富司纯子/沈恩京/铃木京香/张震";
    FilmModel12.filmStar_five =0.8;
    FilmModel12.filmStar_foure =0.3;
    FilmModel12.filmStar_three =0.1;
    FilmModel12.filmStar_two =0.5;
    FilmModel12.filmStar_one =0.2;
    FilmModel12.isColletcd = NO;
    FilmModel12.ListArr = @[@{@"img":@"http://image14.m1905.cn/uploadfile/2011/0728/thumb_1_300_410_20110728111226721.jpg",@"title":@"富司纯子"},@{@"img":@"http://image11.m1905.cn/uploadfile/2014/0228/thumb_1_300_410_20140228111120537824.jpg",@"title":@"沈恩京"},@{@"img":@"http://image11.m1905.cn/uploadfile/2013/0409/thumb_1_300_410_20130409033955284.jpg",@"title":@"铃木京香"},@{@"img":@"http://image14.m1905.cn/mdb/uploadfile/2017/1207/thumb_1_300_410_20171207013956689005.jpg",@"title":@"张震"}];
    FilmModel12.intrduce = @"奶奶娟子(富司纯子饰)、孙女渚(沈恩京饰)住在山茶花盛开的房屋中，故事讲述了一年中来过这里的人们。铃木京香饰演渚的姑姑，张震扮演不受欢迎的访客黄。";
    FilmModel12.CoinNum = 3127;
    FilmModel12.DoubanNum = 5.7;
    FilmModel12.FilmID = 12;
    FilmModel12.tagOne= @"剧情";
    FilmModel12.tagTwo = @"";
    FilmModel12.time = @"2021-04-09(日本)";
    FilmModel12.Top_filmType = 1;
    [tempArr addObject:FilmModel12];
    
    
    
    FilmFacotryHomeModel * FilmModel13 = [[FilmFacotryHomeModel alloc]init];
    FilmModel13.total_Num = 4;
    FilmModel13.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2021/0129/thumb_1_283_390_20210129042050249757.jpg";
    FilmModel13.famous = @"信使";
    FilmModel13.englishNae  =@"The Courier";
    FilmModel13.filmtype = @"剧情";
    FilmModel13.articlList = @"本尼迪克特·康伯巴奇/沈恩京/蕾切尔·布罗斯纳安";
    FilmModel13.filmStar_five =0.6;
    FilmModel13.filmStar_foure =0.4;
    FilmModel13.filmStar_three =0.2;
    FilmModel13.filmStar_two =0.1;
    FilmModel13.filmStar_one =0.2;
    FilmModel13.isColletcd = NO;
    FilmModel13.ListArr = @[@{@"img":@"http://image11.m1905.cn/uploadfile/2013/1217/thumb_1_300_410_20131217102130438536.jpg",@"title":@"本尼迪克特·康伯巴奇"},@{@"img":@"http://image11.m1905.cn/mdb/uploadfile/2017/1020/thumb_1_300_410_20171020091309520668.jpg",@"title":@"蕾切尔·布罗斯纳安"}];
    FilmModel13.intrduce = @"故事根据格里维尔·韦恩(本尼迪克特饰演)的真实事件改编的。格里维尔·韦恩是一位英国商人，曾在冷战期间帮助美国中央情报局渗透苏联的核项目。韦恩和他的俄罗斯线人奥列格·彭科夫斯基提供了结束古巴导弹危机的关键情报。";
    FilmModel13.CoinNum = 47123;
    FilmModel13.DoubanNum = 6.9;
    FilmModel13.FilmID = 13;
    FilmModel13.tagOne= @"剧情";
    FilmModel13.tagTwo = @"";
    FilmModel13.time = @"2021-03-19(美国)";
    FilmModel13.Top_filmType = 1;
    [tempArr addObject:FilmModel13];
    
    
    FilmFacotryHomeModel * FilmModel14 = [[FilmFacotryHomeModel alloc]init];
    FilmModel14.total_Num = 5;
    FilmModel14.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2020/1222/thumb_1_283_390_20201222085757354043.jpg";
    FilmModel14.famous = @"美国之旅2";
    FilmModel14.englishNae  =@"Coming to America 2 ";
    FilmModel14.filmtype = @"喜剧";
    FilmModel14.articlList = @"艾迪·墨菲/詹姆斯·厄尔·琼斯/Jermaine Fowler";
    FilmModel14.filmStar_five =0.8;
    FilmModel14.filmStar_foure =0.4;
    FilmModel14.filmStar_three =0.4;
    FilmModel14.filmStar_two =0.2;
    FilmModel14.filmStar_one =0.1;
    FilmModel14.isColletcd = NO;
    FilmModel14.ListArr = @[@{@"img":@"http://image13.m1905.cn/uploadfile/2012/0719/thumb_1_300_410_20120719041224474.jpg",@"title":@"艾迪·墨菲"},@{@"img":@"http://image14.m1905.cn/uploadfile/2013/0315/thumb_1_300_410_20130315043044871.jpg",@"title":@"詹姆斯·厄尔·琼斯"},@{@"img":@"http://image13.m1905.cn/mdb/uploadfile/2018/0312/thumb_1_300_410_20180312093713379701.jpg",@"title":@"Jermaine Fowler"}];
    FilmModel14.intrduce = @"乔纳森·莱文([抗癌的我]、[母女大战])将执导1988年艾迪·墨菲主演的[美国之旅]续集。[嗨翻姐妹行]编剧肯尼亚·巴里斯执笔剧本。艾迪·墨菲也参与到该片的制作中，尽管目前尚不明确他是否回归主演。";
    FilmModel14.CoinNum = 47123;
    FilmModel14.DoubanNum = 7.3;
    FilmModel14.FilmID = 14;
    FilmModel14.tagOne= @"喜剧";
    FilmModel14.tagTwo = @"";
    FilmModel14.time = @"2021-03-05(美国)";
    FilmModel14.Top_filmType = 1;
    [tempArr addObject:FilmModel14];
    
    
    FilmFacotryHomeModel * FilmModel15 = [[FilmFacotryHomeModel alloc]init];
    FilmModel15.total_Num = 3;
    FilmModel15.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2021/0325/thumb_1_283_390_20210325091305262105.jpg";
    FilmModel15.famous = @"偷渡者";
    FilmModel15.englishNae  =@"Stowaway";
    FilmModel15.filmtype = @"剧情 科幻 惊悚";
    FilmModel15.articlList = @"安娜·肯德里克/丹尼尔·金";
    FilmModel15.filmStar_five =0.5;
    FilmModel15.filmStar_foure =0.2;
    FilmModel15.filmStar_three =0.1;
    FilmModel15.filmStar_two =0.1;
    FilmModel15.filmStar_one =0.2;
    FilmModel15.isColletcd = NO;
    FilmModel15.ListArr = @[@{@"img":@"http://image11.m1905.cn/uploadfile/2013/1206/thumb_1_300_410_20131206110423229835.jpg",@"title":@"安娜·肯德里克"},@{@"img":@"http://image13.m1905.cn/uploadfile/2013/0329/thumb_1_300_410_20130329014842323.jpg",@"title":@"丹尼尔·金"}];
    FilmModel15.intrduce = @"一艘宇宙飞船前往火星，起飞不久后机组成员却发现了一个偷渡者。由于这艘飞船的装备只能支持三名乘客，而且它的生命支持系统也受到了一些无法弥补的损害，机组成员们面临着一个不可能解决的问题。";
    FilmModel15.CoinNum = 4678;
    FilmModel15.DoubanNum = 7.3;
    FilmModel15.FilmID = 15;
    FilmModel15.tagOne= @"剧情";
    FilmModel15.tagTwo = @"科幻";
    FilmModel15.time = @"2021-04-22(美国)";
    FilmModel15.Top_filmType = 1;
    [tempArr addObject:FilmModel15];
    
    
    FilmFacotryHomeModel * FilmModel16 = [[FilmFacotryHomeModel alloc]init];
    FilmModel16.total_Num = 3;
    FilmModel16.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2020/1211/thumb_1_283_390_20201211044305170567.jpg";
    FilmModel16.famous = @"小人物";
    FilmModel16.englishNae  =@"Nobody";
    FilmModel16.filmtype = @"动作 惊悚";
    FilmModel16.articlList = @"康妮·尼尔森/鲍勃·奥登科克";
    FilmModel16.filmStar_five =0.6;
    FilmModel16.filmStar_foure =0.3;
    FilmModel16.filmStar_three =0.1;
    FilmModel16.filmStar_two =0.1;
    FilmModel16.filmStar_one =0.2;
    FilmModel16.isColletcd = NO;
    FilmModel16.ListArr = @[@{@"img":@"http://image13.m1905.cn/uploadfile/2013/1231/thumb_1_300_410_20131231120252786580.jpg",@"title":@"康妮·尼尔森"},@{@"img":@"http://image13.m1905.cn/uploadfile/2013/1129/thumb_1_300_410_20131129015612483625.jpg",@"title":@"鲍勃·奥登科克"}];
    FilmModel16.intrduce = @"一艘宇宙飞船前往火星，起飞不久后机组成员却发现了一个偷渡者。由于这艘飞船的装备只能支持三名乘客，而且它的生命支持系统也受到了一些无法弥补的损害，机组成员们面临着一个不可能解决的问题。";
    FilmModel16.CoinNum = 12784;
    FilmModel16.DoubanNum = 5.0;
    FilmModel16.FilmID = 16;
    FilmModel16.tagOne= @"动作";
    FilmModel16.tagTwo = @"惊悚";
    FilmModel16.time = @"2021-04-02(美国)";
    FilmModel16.Top_filmType = 1;
    [tempArr addObject:FilmModel16];
    
    
    
    FilmFacotryHomeModel * FilmModel17 = [[FilmFacotryHomeModel alloc]init];
    FilmModel17.total_Num = 5;
    FilmModel17.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2021/0326/thumb_1_283_390_20210326092453343388.jpg";
    FilmModel17.famous = @"人之怒";
    FilmModel17.englishNae  =@"Wrath of Man";
    FilmModel17.filmtype = @"动作 犯罪";
    FilmModel17.articlList = @"杰森·斯坦森/乔什·哈奈特/斯科特·伊斯特伍德";
    FilmModel17.filmStar_five =0.8;
    FilmModel17.filmStar_foure =0.3;
    FilmModel17.filmStar_three =0.1;
    FilmModel17.filmStar_two =0.1;
    FilmModel17.filmStar_one =0.2;
    FilmModel17.isColletcd = NO;
    FilmModel17.ListArr = @[@{@"img":@"http://image13.m1905.cn/mdb/uploadfile/2019/0819/thumb_1_300_410_20190819020825626436.jpg",@"title":@"杰森·斯坦森"},@{@"img":@"http://image11.m1905.cn/uploadfile/2009/0820/thumb_1_300_410_200908201052019583058.jpg",@"title":@"乔什·哈奈特"},@{@"img":@"http://image11.m1905.cn/uploadfile/2012/1228/thumb_1_300_410_20121228010753939.jpg",@"title":@"斯科特·伊斯特伍德"}];
    FilmModel17.intrduce = @"翻拍自2004年的法国电影《运钞车》，讲述冷酷、神秘的H在一家运钞车公司工作，每周运送数百万美元运往来洛杉矶。";
    FilmModel17.CoinNum = 31784;
    FilmModel17.DoubanNum = 6.9;
    FilmModel17.FilmID = 17;
    FilmModel17.tagOne= @"动作";
    FilmModel17.tagTwo = @"犯罪";
    FilmModel17.time = @"2021-05-07(美国)";
    FilmModel17.Top_filmType = 2;
    [tempArr addObject:FilmModel17];
    
    
    FilmFacotryHomeModel * FilmModel18 = [[FilmFacotryHomeModel alloc]init];
    FilmModel18.total_Num = 3;
    FilmModel18.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2021/0409/thumb_1_283_390_20210409040722609282.jpg";
    FilmModel18.famous = @"窗里的女人";
    FilmModel18.englishNae  =@"The Woman in the Window ";
    FilmModel18.filmtype = @"悬疑 剧情 犯罪";
    FilmModel18.articlList = @"艾米·亚当斯/朱丽安·摩尔/加里·奥德曼";
    FilmModel18.filmStar_five =0.7;
    FilmModel18.filmStar_foure =0.3;
    FilmModel18.filmStar_three =0.2;
    FilmModel18.filmStar_two =0.1;
    FilmModel18.filmStar_one =0.2;
    FilmModel18.isColletcd = NO;
    FilmModel18.ListArr = @[@{@"img":@"http://image13.m1905.cn/uploadfile/2014/1118/thumb_1_300_410_20141118091813643088.jpg",@"title":@"艾米·亚当斯"},@{@"img":@"http://image11.m1905.cn/uploadfile/2015/0106/thumb_1_300_410_20150106035608207551.jpg",@"title":@"朱丽安·摩尔"},@{@"img":@"http://image14.m1905.cn/uploadfile/2013/1020/thumb_1_300_410_20131020085759858.jpg",@"title":@"加里·奥德曼"}];
    FilmModel18.intrduce = @"影片根据A.J. Finn创作的同名畅销小说改编。故事围绕安娜·福克斯(亚当斯饰)展开，她每日躲在自己家中，暗中窥视领居们的一举一动，而当她注意到看似完美的罗素一家时，未知和危险也将到来。";
    FilmModel18.CoinNum = 4823;
    FilmModel18.DoubanNum = 7.6;
    FilmModel18.FilmID = 18;
    FilmModel18.tagOne= @"悬疑";
    FilmModel18.tagTwo = @"剧情";
    FilmModel18.time = @"2021-05-14(美国)";
    FilmModel18.Top_filmType = 2;
    [tempArr addObject:FilmModel18];

    
    
    FilmFacotryHomeModel * FilmModel19 = [[FilmFacotryHomeModel alloc]init];
    FilmModel19.total_Num = 3;
    FilmModel19.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2020/0214/thumb_1_283_390_20200214113711593220.jpg";
    FilmModel19.famous = @"侏罗纪世界3：统治";
    FilmModel19.englishNae  =@"Jurassic World: Dominion ";
    FilmModel19.filmtype = @"动作 科幻 冒险";
    FilmModel19.articlList = @"劳拉·邓恩/布莱斯·达拉斯·霍华德/克里斯·帕拉特";
    FilmModel19.filmStar_five =0.4;
    FilmModel19.filmStar_foure =0.6;
    FilmModel19.filmStar_three =0.1;
    FilmModel19.filmStar_two =0.1;
    FilmModel19.filmStar_one =0.2;
    FilmModel19.isColletcd = NO;
    FilmModel19.ListArr = @[@{@"img":@"http://image11.m1905.cn/mdb/uploadfile/2020/0205/thumb_1_300_410_20200205031333334506.jpg",@"title":@"劳拉·邓恩"},@{@"img":@"http://image14.m1905.cn/uploadfile/2013/0329/thumb_1_168_230_20130329054025786.jpg",@"title":@"布莱斯·达拉斯·霍华德"},@{@"img":@"http://image13.m1905.cn/uploadfile/2014/1120/thumb_1_300_410_20141120095911309352.jpg",@"title":@"克里斯·帕拉特"}];
    FilmModel19.intrduce = @"《侏罗纪世界3：统治》是环球影业出品的《侏罗纪世界》系列科幻冒险电影第三集，将于2022年6月10上映。 ";
    FilmModel19.CoinNum = 42378;
    FilmModel19.DoubanNum = 8.7;
    FilmModel19.FilmID = 19;
    FilmModel19.tagOne= @"动作";
    FilmModel19.tagTwo = @"科幻";
    FilmModel19.time = @"2021-06-11(美国)     ";
    FilmModel19.Top_filmType = 2;
    [tempArr addObject:FilmModel19];
    
    
    FilmFacotryHomeModel * FilmModel20 = [[FilmFacotryHomeModel alloc]init];
    FilmModel20.total_Num = 3;
    FilmModel20.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2020/0310/thumb_1_283_390_20200310091515917165.jpg";
    FilmModel20.famous = @"黑寡妇";
    FilmModel20.englishNae  =@"The Black Widow";
    FilmModel20.filmtype = @"动作 科幻 冒险";
    FilmModel20.articlList = @"斯嘉丽·约翰逊/弗洛伦斯·皮尤/蕾切尔·薇兹";
    FilmModel20.filmStar_five =0.8;
    FilmModel20.filmStar_foure =0.4;
    FilmModel20.filmStar_three =0.3;
    FilmModel20.filmStar_two =0.2;
    FilmModel20.filmStar_one =0.1;
    FilmModel20.isColletcd = NO;
    FilmModel20.ListArr = @[@{@"img":@"http://image13.m1905.cn/uploadfile/2015/0127/thumb_1_300_410_20150127083959954302.jpg",@"title":@"斯嘉丽·约翰逊"},@{@"img":@"http://image13.m1905.cn/mdb/uploadfile/2018/0307/thumb_1_300_410_20180307100548360699.jpg",@"title":@"弗洛伦斯·皮尤"},@{@"img":@"http://image14.m1905.cn/uploadfile/2013/0305/thumb_1_300_410_20130305041450487.jpg",@"title":@"蕾切尔·薇兹"}];
    FilmModel20.intrduce = @"一部充满动作戏的间谍惊悚片。娜塔莎·罗曼诺夫/黑寡妇遭遇与她的过去相关的一场危险阴谋，将直面自己那些更为黑暗的经历。一股不惜一切要击倒她的力量袭来，娜塔莎必须面对自己在成为复仇者的很久之前那作为间谍的过往，和曾远离的破碎关系。";
    FilmModel20.CoinNum = 57892;
    FilmModel20.DoubanNum = 7.2;
    FilmModel20.FilmID = 20;
    FilmModel20.tagOne= @"动作";
    FilmModel20.tagTwo = @"科幻";
    FilmModel20.time = @"2021-07-09(美国)";
    FilmModel20.Top_filmType = 2;
    [tempArr addObject:FilmModel20];
    
    
    FilmFacotryHomeModel * FilmModel21 = [[FilmFacotryHomeModel alloc]init];
    FilmModel21.total_Num = 3;
    FilmModel21.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2020/0310/thumb_1_283_390_20200310092825941202.jpg";
    FilmModel21.famous = @"电锯惊魂9：螺旋";
    FilmModel21.englishNae  =@"Spiral: From the Book of Saw ";
    FilmModel21.filmtype = @"恐怖";
    FilmModel21.articlList = @"塞缪尔·杰克逊/马利索·妮可/麦克思·明格拉";
    FilmModel21.filmStar_five =0.5;
    FilmModel21.filmStar_foure =0.4;
    FilmModel21.filmStar_three =0.3;
    FilmModel21.filmStar_two =0.2;
    FilmModel21.filmStar_one =0.1;
    FilmModel21.isColletcd = NO;
    FilmModel21.ListArr = @[@{@"img":@"http://image13.m1905.cn/uploadfile/2012/1225/thumb_1_300_410_20121225034212892.jpg",@"title":@"塞缪尔·杰克逊"},@{@"img":@"http://image11.m1905.cn/uploadfile/2012/1102/thumb_1_300_410_20121102013858274.jpg",@"title":@"马利索·妮可"},@{@"img":@"http://image14.m1905.cn/uploadfile/2013/0321/thumb_1_300_410_20130321020520872.jpg",@"title":@"麦克思·明格拉"}];
    FilmModel21.intrduce = @"狮门影业重启开启了温子仁职业生涯的《电锯惊魂》系列。剧本基于克里斯·洛克构思的一个故事，由皮特·古德芬格(《电锯惊魂8：竖锯》)、乔什·斯托尔伯格(《食人鱼3D》)撰写剧本。执导了《电锯惊魂》系列三部影片的达伦·林恩·鲍斯回归执导。";
    FilmModel21.CoinNum = 57892;
    FilmModel21.DoubanNum = 8.9;
    FilmModel21.FilmID = 21;
    FilmModel21.tagOne= @"恐怖";
    FilmModel21.tagTwo = @"";
    FilmModel21.time = @"2021-05-14(美国)";
    FilmModel21.Top_filmType = 2;
    [tempArr addObject:FilmModel21];
    
    
    FilmFacotryHomeModel * FilmModel22 = [[FilmFacotryHomeModel alloc]init];
    FilmModel22.total_Num = 4;
    FilmModel22.imgTubUrl = @"https://image11.m1905.cn/mdb/uploadfile/2019/1205/thumb_1_283_390_20191205092914319879.jpg";
    FilmModel22.famous = @"007：无暇赴死";
    FilmModel22.englishNae  =@"Bond 25";
    FilmModel22.filmtype = @"动作 惊悚";
    FilmModel22.articlList = @"丹尼尔·克雷格/蕾雅·赛杜/拉米·马雷克/本·卫肖";
    FilmModel22.filmStar_five =0.7;
    FilmModel22.filmStar_foure =0.3;
    FilmModel22.filmStar_three =0.6;
    FilmModel22.filmStar_two =0.1;
    FilmModel22.filmStar_one =0.1;
    FilmModel22.isColletcd = NO;
    FilmModel22.ListArr = @[@{@"img":@"http://image14.m1905.cn/uploadfile/2013/0122/thumb_1_300_410_20130122110606301.jpg",@"title":@"丹尼尔·克雷格"},@{@"img":@"http://image14.m1905.cn/uploadfile/2014/0905/thumb_1_300_410_20140905095626569818.jpg",@"title":@"蕾雅·赛杜"},@{@"img":@"http://image11.m1905.cn/mdb/uploadfile/2019/0218/thumb_1_300_410_20190218035837311784.jpg",@"title":@"拉米·马雷克"},@{@"img":@"http://image14.m1905.cn/uploadfile/2014/1201/thumb_1_300_410_20141201012520228906.jpg",@"title":@"本·卫肖"}];
    FilmModel22.intrduce = @"这两部影片或将成为007历史上第一次“背靠背拍摄”的影片，最早将在明年秋天开拍，其中第24部007电影计划在2014年秋上映，丹尼尔·克雷格（Daniel Craig）将继续扮演邦德。";
    FilmModel22.CoinNum = 57892;
    FilmModel22.DoubanNum = 7.4;
    FilmModel22.FilmID = 22;
    FilmModel22.tagOne= @"动作";
    FilmModel22.tagTwo = @"惊悚";
    FilmModel22.time = @"2021-10-08(美国)";
    FilmModel22.Top_filmType = 2;
    [tempArr addObject:FilmModel22];
    

    BOOL FilmStatus = [[NSUserDefaults standardUserDefaults] boolForKey:@"FilmFactroyStatus"];
    if (FilmStatus == NO) {
    BOOL isSuccced =     [WHC_ModelSqlite inserts:tempArr.copy];
        [[NSUserDefaults standardUserDefaults] setBool:isSuccced forKey:@"FilmFactroyStatus"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
  
}
+(void)XYZLikeChatDetailMdoelConfig{
    NSMutableArray * tempArr =[NSMutableArray array];
    FilmChatDetailMoel * FilmDetail = [[FilmChatDetailMoel alloc]init];
    FilmDetail.msgname = @"楼主，你这个缩印真心做的很牛逼呀";
    FilmDetail.userID = 0;
    FilmDetail.imgUrl = @"https://img2.doubanio.com/icon/up230533267-3.jpg";
    FilmDetail.msgisMe = YES;
    [tempArr addObject:FilmDetail];
    
    FilmChatDetailMoel * FilmDetail1 = [[FilmChatDetailMoel alloc]init];
    FilmDetail1.msgname = @"是吧，我自己也觉得很不错呢，😁，有没有很崇拜我";
    FilmDetail1.userID = 0;
    FilmDetail1.imgUrl = @"https://img2.doubanio.com/icon/up230533267-3.jpg";
    FilmDetail1.msgisMe = NO;
    [tempArr addObject:FilmDetail1];
    
    FilmChatDetailMoel * FilmDetail2 = [[FilmChatDetailMoel alloc]init];
    FilmDetail2.msgname = @"在下属实很崇拜你呢～😹😹😹";
    FilmDetail2.userID = 0;
    FilmDetail2.imgUrl = @"";
    FilmDetail2.msgisMe = YES;
    [tempArr addObject:FilmDetail2];
    
    
    FilmChatDetailMoel * FilmDetail3 = [[FilmChatDetailMoel alloc]init];
    FilmDetail3.msgname = @"哈哈哈哈哈哈哈哈哈但凡lz能花干这个十分之一的心思背课文还至于默写不出吗🐒";
    FilmDetail3.userID = 1;
    FilmDetail3.imgUrl = @"https://img3.doubanio.com/icon/u214879397-1.jpg";
    FilmDetail3.msgisMe = YES;
    [tempArr addObject:FilmDetail3];
    
    
    FilmChatDetailMoel * FilmDetail4 = [[FilmChatDetailMoel alloc]init];
    FilmDetail4.msgname = @"我确实在背诵呀，只是这脑子不好使，动不动忘记了";
    FilmDetail4.userID = 1;
    FilmDetail4.imgUrl = @"https://img3.doubanio.com/icon/u214879397-1.jpg";
    FilmDetail4.msgisMe = NO;
    [tempArr addObject:FilmDetail4];
    
    FilmChatDetailMoel * FilmDetail5 = [[FilmChatDetailMoel alloc]init];
    FilmDetail5.msgname = @"当我们谈论电影时，“催泪”似乎是有些廉价，甚至略带贬义的形容词";
    FilmDetail5.userID = 2;
    FilmDetail5.imgUrl = @"https://img2.doubanio.com/icon/u68319765-2.jpg";
    FilmDetail5.msgisMe = YES;
    [tempArr addObject:FilmDetail5];
    
    FilmChatDetailMoel * FilmDetail6 = [[FilmChatDetailMoel alloc]init];
    FilmDetail6.msgname = @"我并不觉得廉价哦，是否廉价取决于自己的生活态度，谢谢";
    FilmDetail6.userID = 2;
    FilmDetail6.imgUrl = @"https://img2.doubanio.com/icon/u68319765-2.jpg";
    FilmDetail6.msgisMe = NO;
    [tempArr addObject:FilmDetail6];
    
        FilmChatDetailMoel * FilmDetail7 = [[FilmChatDetailMoel alloc]init];
    FilmDetail7.msgname = @"楼主你自己 有感同深受过吗？";
    FilmDetail7.userID = 3;
    FilmDetail7.imgUrl = @"https://img9.doubanio.com/icon/u139444387-5.jpg";
    FilmDetail7.msgisMe = YES;
        [tempArr addObject:FilmDetail7];
    

    BOOL FilmDetailSucced = [[NSUserDefaults standardUserDefaults] boolForKey:@"FilmDetail"];
    if (FilmDetailSucced == NO) {
        BOOL FilmDetailSuccedStatus = [WHC_ModelSqlite inserts:tempArr.copy];
        [[NSUserDefaults standardUserDefaults] setBool:FilmDetailSuccedStatus forKey:@"FilmDetail"];
        [[NSUserDefaults standardUserDefaults] synchronize];

    }
}
+(void)XiaoxinMsgListModelConfig{
    NSMutableArray * tempArr =[NSMutableArray array];
    FilmChatMsgListModel * listModel = [[FilmChatMsgListModel alloc]init];
    listModel.imgurl = @"https://img2.doubanio.com/icon/up230533267-3.jpg";
    listModel.topname = @"犄角掉了";
    listModel.content = @"楼主，你这个缩印真心做的很牛逼呀";
    listModel.time = @"2021-0-26 12:34:19";
    listModel.ChatID = 0;
    listModel.redNum = 1;
    listModel.isShowRed = NO;
    [tempArr addObject:listModel];
    
    
    FilmChatMsgListModel * listModel1 = [[FilmChatMsgListModel alloc]init];
    listModel1.imgurl = @"https://img3.doubanio.com/icon/u214879397-1.jpg";
    listModel1.topname = @"pharmaceutical";
    listModel1.content = @"哈哈哈哈哈哈哈哈哈但凡lz能花干这个十分之一的心思背课文还至于默写不出吗🐒";
    listModel1.time = @"2021-04-26 09:21:13";
    listModel1.ChatID = 1;
    listModel1.redNum = 1;
    listModel1.isShowRed = NO;
    [tempArr addObject:listModel1];
    
    
    
    
    
    
    
    FilmChatMsgListModel * listModel2 = [[FilmChatMsgListModel alloc]init];
    listModel2.imgurl = @"https://img2.doubanio.com/icon/u68319765-2.jpg";
    listModel2.topname = @"阿达 ";
    listModel2.content = @"我并不觉得廉价哦，是否廉价取决于自己的生活态度，谢谢";
    listModel2.time = @"周三";
    listModel2.ChatID = 2;
    listModel2.isShowRed = NO;
    [tempArr addObject:listModel2];

    
    FilmChatMsgListModel * listModel3 = [[FilmChatMsgListModel alloc]init];
    listModel3.imgurl = @"https://img9.doubanio.com/icon/u139444387-5.jpg";
    listModel3.topname = @"深焦DeepFocus ";
    listModel3.content = @"楼主你自己 有感同深受过吗？";
    listModel3.time = @"周一";
    listModel3.ChatID = 3;
    listModel3.isShowRed = NO;
    [tempArr addObject:listModel3];

    
    
    BOOL FilmmsgSucced = [[NSUserDefaults standardUserDefaults] boolForKey:@"FilmZoneMsgList"];
    if (FilmmsgSucced == NO) {
        BOOL FilmMsgStatus = [WHC_ModelSqlite inserts:tempArr.copy];
        [[NSUserDefaults standardUserDefaults] setBool:FilmMsgStatus forKey:@"FilmZoneMsgList"];
        [[NSUserDefaults standardUserDefaults] synchronize];

    }
}
+(void)FilmFactoryZoneModelConfig{
    NSMutableArray * tempArr = [NSMutableArray array];
    
    FilmFactoryZoneModel * zoneModel=  [[FilmFactoryZoneModel alloc]init];
    zoneModel.SectionID = 0;
    zoneModel.name = @"潜暗 ";
    zoneModel.times  =@"18:51:04";
    zoneModel.userImgIcon = @"https://img3.doubanio.com/icon/u229164599-1.jpg";
    zoneModel.imgThuburls = @[@"https://img9.doubanio.com/view/group_topic/l/public/p440361755.jpg",@"https://img1.doubanio.com/view/group_topic/l/public/p440361759.jpg"];
    zoneModel.title = @"有没有和《过把瘾》差不多的电视剧？";
    zoneModel.detail = @"看剧多的同志们能不能推荐一下，就这像《过把瘾》这样，讲述平凡人的爱情的，剧情简洁干练不狗血，最好是以八九十年代为背景的。";
    zoneModel.ZoneDetrailID = 0;
    zoneModel.SectionTime = @"08日 2021年05月";
    [tempArr addObject:zoneModel];
    
    
    FilmFactoryZoneModel * zoneModel1 =  [[FilmFactoryZoneModel alloc]init];
    zoneModel1.SectionID = 0;
    zoneModel1.name = @"爱意随风起  ";
    zoneModel1.times  =@"14:16";
    zoneModel1.userImgIcon   = @"https://img2.doubanio.com/icon/u178496664-3.jpg";
    zoneModel1.imgThuburls = @[@"https://img9.doubanio.com/view/group_topic/l/public/p439624325.jpg"];
    zoneModel1.title = @"请问有没有什么小众的悬疑电影推荐的啊？";
    zoneModel1.detail = @"因为有名的，评分高的基本看过啦，谢谢各位嘞";
    zoneModel1.ZoneDetrailID = 1;
    zoneModel1.SectionTime = @"07日 2021年05月";
    [tempArr addObject:zoneModel1];
    
    
    

    
    FilmFactoryZoneModel * zoneModel2 =  [[FilmFactoryZoneModel alloc]init];
    zoneModel2.SectionID = 1;
    zoneModel2.name = @"阿达 ";
    zoneModel2.times  =@"10:09";
    zoneModel2.userImgIcon = @"https://img2.doubanio.com/icon/u68319765-2.jpg";
    zoneModel2.imgThuburls = @[@"https://img1.doubanio.com/view/note/l/public/p81309838.jpg",@"https://img1.doubanio.com/view/note/l/public/p81310767.jpg",@"https://img1.doubanio.com/view/note/l/public/p81250429.jpg",@"https://img3.doubanio.com/view/note/l/public/p81248260.jpg"];
    zoneModel2.title = @"【寻梦环游记】的剧本为什么那么催泪";
    zoneModel2.detail = @"晚上刷手机刷到了纯音乐版的“Remember Me”，又去找了电影的cut，当时在影院哭的稀里哗啦的感觉再次涌上心头。不禁感叹，【寻梦环游记】（Coco）是这几年上映的最催泪的电影了。";
    zoneModel2.ZoneDetrailID = 2;
    zoneModel2.SectionTime = @"25日 2021年04月";
    [tempArr addObject:zoneModel2];
    
    FilmFactoryZoneModel * zoneModel3 =  [[FilmFactoryZoneModel alloc]init];
    zoneModel3.SectionID = 1;
    zoneModel3.name = @"深焦DeepFocus";
    zoneModel3.times  =@"20:12";
    zoneModel3.userImgIcon = @"https://img9.doubanio.com/icon/u139444387-5.jpg";
    zoneModel3.imgThuburls = @[@"https://img1.doubanio.com/view/note/l/public/p81321997.jpg",@"https://img1.doubanio.com/view/note/l/public/p81321999.jpg",@"https://img3.doubanio.com/view/note/l/public/p81322001.jpg"];
    zoneModel3.title = @"去年法国人把最佳电影，发给了这部忧伤的喜剧";
    zoneModel3.detail = @"《拜拜笨蛋》一片的结尾和很多年前的另一部法国片《两小无猜》有着异曲同工之妙：在喜剧的尽头以死的悲剧终结一切。我们似乎可以以悲喜交集来形容本部作品，甚至可以延伸出一系列溢美之辞。";
    zoneModel3.ZoneDetrailID = 3;
    zoneModel3.SectionTime = @"25日 2021年04月";
    [tempArr addObject:zoneModel3];


    FilmFactoryZoneModel * zoneModel4 =  [[FilmFactoryZoneModel alloc]init];
    zoneModel3.SectionID = 1;
    zoneModel4.name = @"杨多荤";
    zoneModel4.times  =@"19:21";
    zoneModel4.userImgIcon = @"https://img1.doubanio.com/icon/u91740338-17.jpg";
    zoneModel4.imgThuburls = @[@"https://img1.doubanio.com/view/status/l/public/01a595f205dfe3c.jpg",@"https://img3.doubanio.com/view/status/l/public/ce3d6113b31a2a1.jpg"];
    zoneModel4.title = @"电影中充满爱意的眼神";
    zoneModel4.detail = @"看《波斯语课》想要触碰却收回的手，想到了《爱在》中同样的情节。小心翼翼地爱着对方，如同时间的密语。";
    zoneModel4.ZoneDetrailID = 4;
    zoneModel4.SectionTime = @"25日 2021年04月";
    [tempArr addObject:zoneModel4];

    
    
    FilmFactoryZoneModel * zoneModel5 =  [[FilmFactoryZoneModel alloc]init];
    zoneModel5.SectionID = 2;
    zoneModel5.name = @"木下惠介";
    zoneModel5.times  =@"22:19";
    zoneModel5.userImgIcon = @"https://img9.doubanio.com/icon/u162245631-95.jpg";
    zoneModel5.imgThuburls = @[@"https://img1.doubanio.com/view/status/l/public/0cb346e0f49496a.jpg",@"https://img2.doubanio.com/view/status/l/public/28f1ac20bd97c7f.jpg",@"https://img3.doubanio.com/view/status/l/public/66c3912a7c2c7de.jpg"];
    zoneModel5.title = @"影视作品中的氛围感美人";
    zoneModel5.detail = @"一辈子要有一张这样的照片就好了。她区别于你周围 10 公里以内任何一个人";
    zoneModel5.ZoneDetrailID = 5;
    zoneModel5.SectionTime = @"23日 2021年04月";
    [tempArr addObject:zoneModel5];
    
    
    FilmFactoryZoneModel * zoneModel6 =  [[FilmFactoryZoneModel alloc]init];
    zoneModel6.SectionID = 2;
    zoneModel6.name = @"BeateZ ";
    zoneModel6.times  =@"14:26";
    zoneModel6.userImgIcon = @"https://img2.doubanio.com/icon/u136169341-2.jpg";
    zoneModel6.imgThuburls = @[@"https://img3.doubanio.com/view/status/l/public/3f82f2005a3499e.jpg",@"https://img9.doubanio.com/view/status/l/public/8db7632fd68d945.jpg",@"https://img9.doubanio.com/view/status/l/public/d310960de41f7f6.jpg"];
    zoneModel6.title = @"影视作品中的氛围感美人";
    zoneModel6.detail = @"《大汉天子》王灵饰卫子夫。“心如水晶颜如玉，不与群芳争短长。”正如话题描述所说，无论是对剧中的少年刘彻还是电视机前的观众而言，她的美不是凸显出来的，而是一点一点进入到人心里的。";
    zoneModel6.ZoneDetrailID = 6;
    zoneModel6.SectionTime = @"23日 2021年04月";
    [tempArr addObject:zoneModel6];

    
    
    
    
    BOOL FilmmzoneStat = [[NSUserDefaults standardUserDefaults] boolForKey:@"FilmFaoctZone"];
    if (FilmmzoneStat == NO) {
        BOOL FilmFaoctZone = [WHC_ModelSqlite inserts:tempArr.copy];
        [[NSUserDefaults standardUserDefaults] setBool:FilmFaoctZone forKey:@"FilmFaoctZone"];
        [[NSUserDefaults standardUserDefaults] synchronize];

    }
}
+(void)FilmFactoryComentModelConfig
{
    NSMutableArray * tempArr = [NSMutableArray array];
    
    FilmFactoryComentModel * comentmdoel = [[FilmFactoryComentModel alloc]init];
    comentmdoel.imgurl = @"https://img1.doubanio.com/icon/u162207724-8.jpg";
    comentmdoel.name = @"sarabi";
    comentmdoel.time = @"14:21";
    comentmdoel.content = @"这个片太好看了，浪漫。";
    comentmdoel.ZoneID = 0;
    comentmdoel.ComentID = 0;
    comentmdoel.CellHeight = 0;
    [tempArr addObject:comentmdoel];
    
    
    FilmFactoryComentModel * comentmdoel1 = [[FilmFactoryComentModel alloc]init];
    comentmdoel1.imgurl = @"https://img9.doubanio.com/icon/u3333153-5.jpg";
    comentmdoel1.name = @"尖牙利爪 (你是我的猫，我是你的人) ";
    comentmdoel1.time = @"14:45";
    comentmdoel1.content = @"尖牙利爪 (你是我的猫，我是你的人) ";
    comentmdoel1.ZoneID = 0;
    comentmdoel1.ComentID = 1;
    comentmdoel1.CellHeight = 0;
    [tempArr addObject:comentmdoel1];

    
    FilmFactoryComentModel * comentmdoel2 = [[FilmFactoryComentModel alloc]init];
    comentmdoel2.imgurl = @"https://img2.doubanio.com/icon/u215816664-2.jpg";
    comentmdoel2.name = @"人类行为研究员 ";
    comentmdoel2.time = @"14:45";
    comentmdoel2.content = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈但凡lz能花干这个十分之一的心思背课文还至于默写不出吗🐒";
    comentmdoel2.ZoneID = 0;
    comentmdoel2.ComentID = 2;
    comentmdoel2.CellHeight = 0;
    [tempArr addObject:comentmdoel2];

    
    FilmFactoryComentModel * comentmdoel3 = [[FilmFactoryComentModel alloc]init];
    comentmdoel3.imgurl = @"https://img3.doubanio.com/icon/u195964764-20.jpg";
    comentmdoel3.name = @"我才不是江湖骗子 ";
    comentmdoel3.time = @"16:21";
    comentmdoel3.content = @"家人 我觉得这件很像泳衣 虽然是毛衣但我感受到了一丝清凉";
    comentmdoel3.ZoneID = 1;
    comentmdoel3.ComentID = 3;
    comentmdoel3.CellHeight = 0;
    [tempArr addObject:comentmdoel3];

    FilmFactoryComentModel * comentmdoel4 = [[FilmFactoryComentModel alloc]init];
    comentmdoel4.imgurl = @"https://img2.doubanio.com/icon/u196826257-2.jpg";
    comentmdoel4.name = @"王夫之  ";
    comentmdoel4.time = @"16:52";
    comentmdoel4.content = @"毛衣质感不够颜色饱和度低，慎用毛衣深色拼色哈哈";
    comentmdoel4.ZoneID = 1;
    comentmdoel4.ComentID = 4;
    comentmdoel4.CellHeight = 0;
    [tempArr addObject:comentmdoel4];
    
    FilmFactoryComentModel * comentmdoel5 = [[FilmFactoryComentModel alloc]init];
    comentmdoel5.imgurl = @"https://img2.doubanio.com/icon/u68319765-2.jpg";
    comentmdoel5.name = @"阿达";
    comentmdoel5.time = @"18:12";
    comentmdoel5.content = @"当我们谈论电影时，“催泪”似乎是有些廉价，甚至略带贬义的形容词";
    comentmdoel5.ZoneID = 2;
    comentmdoel5.ComentID = 5;
    comentmdoel5.CellHeight = 0;
    [tempArr addObject:comentmdoel5];
    
    
    FilmFactoryComentModel * comentmdoel6 = [[FilmFactoryComentModel alloc]init];
    comentmdoel6.imgurl = @"https://img2.doubanio.com/icon/up169123101-3.jpg";
    comentmdoel6.name = @"夺铎堕";
    comentmdoel6.time = @"22:12";
    comentmdoel6.content = @"“笨蛋”一词在中文中自带嗔怪之感";
    comentmdoel6.ZoneID = 3;
    comentmdoel6.ComentID = 6;
    comentmdoel6.CellHeight = 0;
    [tempArr addObject:comentmdoel6];
    
    
    
    FilmFactoryComentModel * comentmdoel7 = [[FilmFactoryComentModel alloc]init];
    comentmdoel7.imgurl = @"https://img9.doubanio.com/icon/up162245631-95.jpg";
    comentmdoel7.name = @"木下惠介";
    comentmdoel7.time = @"22:20";
    comentmdoel7.content = @"当时这张照片展出，让很多女孩发疯，她们说一辈子要有一张这样的照片就好了。看完这张照片，你会觉得，她区别于你周围 10 公里以内任何一个人。";
    comentmdoel7.ZoneID = 5;
    comentmdoel7.ComentID = 7;
    comentmdoel7.CellHeight = 0;
    [tempArr addObject:comentmdoel7];

    
    

    
    BOOL isSucedComent = [[NSUserDefaults standardUserDefaults] boolForKey:@"isComment"];
    if (isSucedComent == NO) {
        BOOL  isComment =   [WHC_ModelSqlite inserts:tempArr.copy];
         
         [[NSUserDefaults standardUserDefaults] setDouble:isComment forKey:@"isComment"];
         [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
  
    
}
+(void)FilmFactortLoactionModelConfig{
    NSMutableArray * FilmTempArr  =[NSMutableArray array];
    FilmFactortLoactionModel * locationModel =[[FilmFactortLoactionModel alloc]init];
    locationModel.isBaoming = YES;
    locationModel.imgArrs = @[@"https://image11.m1905.cn/uploadfile/2021/0422/thumb_1_1380_460_20210422115515830912.jpg",@"https://image11.m1905.cn/uploadfile/2021/0421/20210421100904690123.jpg",@"https://image11.m1905.cn/uploadfile/2021/0421/20210421100807468261.jpg",@"https://image11.m1905.cn/uploadfile/2021/0421/20210421100659458584.jpg"];
    locationModel.FilmThubImgView = @"https://image11.m1905.cn/uploadfile/2021/0422/thumb_1_1380_460_20210422115515830912.jpg";
    locationModel.title = @"9.2分！张艺谋的《悬崖之上》要接棒《风声》？";
    locationModel.titleDesc =@"(谍战片 | 冷峻)";
    locationModel.DetailDesc = @"这部定档五一档的谍战大片还将在映前进行两轮点映，足以看出片方对作品质量充满信心。当然，一切表现还得等电影正式上映后才能见真章。2009年的《风声》开启国产谍战片类型创作的先声，这12年间，谍战片的作品数量并不太多，优秀的谍战片也屈指可数，此次《悬崖之上》能否成功接棒，再造谍战片高峰，是许多观众的期待。 而钩沉影史，国产谍战片作为一种特殊片种，从过去到现在经历的类型变化也值得挖掘、观察。“在中国，谍战电影不多，这次碰到令我心动的剧本，希望能拍出特别感。”第一次接触谍战片的张艺谋选择《悬崖之上》，其实不无道理。";
    locationModel.tageOne = @"悬崖之上";
    locationModel.tagTwo = @"白玉兰奖";
    locationModel.isStart = NO;
    locationModel.isCollted = NO;
    locationModel.colltecdNum =43;
    locationModel.joinTime = @"4/29 12:00:00 至 4/30 12:00:00";
    locationModel.playTime = @"5/1 24:00:00 至 5/2 24:00:00";
    locationModel.loaction = @"北京市东城区王府井大街255号北京市百货大楼F8";
    locationModel.phone = @"(010)65234366";
    locationModel.LoactionID = 0;
    [FilmTempArr addObject:locationModel];
    
    
    FilmFactortLoactionModel * locationModel1 =[[FilmFactortLoactionModel alloc]init];
    locationModel1.isBaoming = NO;
    locationModel1.imgArrs = @[@"https://image11.m1905.cn/uploadfile/2021/0420/20210420091203793134.jpg",@"https://image11.m1905.cn/uploadfile/2021/0420/20210420091203916952.jpg",@"https://image11.m1905.cn/uploadfile/2021/0420/20210420091203488830.jpg",@"https://image11.m1905.cn/uploadfile/2021/0420/20210420091203662430.jpg"];
    locationModel1.FilmThubImgView = @"https://image11.m1905.cn/uploadfile/2021/0420/20210420091203793134.jpg";
    locationModel1.title = @"盘点革命年代的伟大爱恋：风雨中，这份爱更浪漫";
    locationModel1.titleDesc =@"(谍战片 | 黄建新)";
    locationModel1.DetailDesc = @"电影《1921》在展现波澜壮阔的建党伟大篇章的同时，也将镜头瞄准了这对革命夫妻在往昔峥嵘岁月中那份可贵的真情。二人相互陪伴、扶持，给予彼此继续奋战的力量。在国家存亡之际，李达和王会悟将夫妻小爱化为无穷力量，奉献给国家大爱，相濡以沫、奔赴共同理想的革命伴侣令人敬佩又动容，毛泽东曾盛赞夫妇俩：“你们是真正的人”。百年前，李达作为中国共产党发起组的代表，担起了全力筹办中国共产党第一次全国代表大会的重任，王会悟则担负大会召开的食宿、守卫等工作。可以说，如今已驶向百年光辉征程的中国共产党，其起点“中共一大”离不开李达王会悟夫妻俩同心同力的贡献与守护。";
    locationModel1.tageOne = @"革命夫妻";
    locationModel1.tagTwo = @"共产党";
    locationModel1.isStart = NO;
    locationModel1.isCollted = NO;
    locationModel1.colltecdNum =21;
    locationModel1.joinTime = @"5/20 10:30:00 至 6/30 12:00:00";
    locationModel1.playTime = @"5/5 12:30:00 至 5/7 12:00:00";
    locationModel1.loaction = @"北京市东城区香河园路1号当代MOMA北区T4座";
    locationModel1.phone = @"(010)84388257";
    locationModel1.LoactionID = 1;
    [FilmTempArr addObject:locationModel1];
    
    
    
    FilmFactortLoactionModel * locationModel2 =[[FilmFactortLoactionModel alloc]init];
    locationModel2.isBaoming = NO;
    locationModel2.imgArrs = @[@"https://image11.m1905.cn/uploadfile/2021/0422/20210422093528960692.jpg",@"https://image11.m1905.cn/uploadfile/2021/0422/20210422093507477089.jpg",@"https://image11.m1905.cn/uploadfile/2021/0422/20210422093512101009.jpg",@"https://image11.m1905.cn/uploadfile/2021/0422/20210422093032561680.jpg"];
    locationModel2.FilmThubImgView = @"https://image11.m1905.cn/uploadfile/2021/0422/20210422093528960692.jpg";
    locationModel2.title = @"解析《真·三国无双》：“魔改”吃力不讨好？";
    locationModel2.titleDesc =@"(游戏迷 | 杜制朗)";
    locationModel2.DetailDesc = @"电影《真·三国无双》将于5月1日登陆五一档，看到这个名字，游戏迷们都坐不住了。因为《真·三国无双》系列游戏最早于2000年发售，陪伴众多“无双粉”玩家20年，以“战场再现”为主题、并通过展现系列概念“一骑当千”的爽快战斗，使玩家深陷在三国无双的魅力之中，而它的首次影视化更是备受游戏迷和影迷期待。";
    locationModel2.tageOne = @"无双粉";
    locationModel2.tagTwo = @"真·三国无双";
    locationModel2.isStart = NO;
    locationModel2.isCollted = NO;
    locationModel2.colltecdNum =39;
    locationModel2.joinTime = @"5/27 11:20:00 至 5/30 10:30:00";
    locationModel2.playTime = @"6/1 10:00:00 至 6/1 24:00:00";
    locationModel2.loaction = @"北京市通州区芙蓉园513号楼2至3层";
    locationModel2.phone = @"(010)80850020";
    locationModel2.LoactionID = 2;
    [FilmTempArr addObject:locationModel2];
    
    
    
    FilmFactortLoactionModel * locationModel3 =[[FilmFactortLoactionModel alloc]init];
    locationModel3.isBaoming = NO;
    locationModel3.imgArrs = @[@"https://image11.m1905.cn/uploadfile/2021/0420/20210420094136681332.jpg",@"https://image11.m1905.cn/uploadfile/2021/0420/20210420093944505624.jpg"];
    locationModel3.FilmThubImgView = @"https://image11.m1905.cn/uploadfile/2021/0420/20210420094136681332.jpg";
    locationModel3.title = @"《八月未央》遭吐槽 原来小说影视化的秘密在这里";
    locationModel3.titleDesc =@"(原著风格 | 李凯)";
    locationModel3.DetailDesc = @"从目前的票房和口碑来看，电影却未能复制小说的成功。豆瓣3.9分，票房不足5000万，《八月未央》“扑”得很彻底。 网友在热评中写道：“闺蜜反目、小三、车祸、自杀，没想到2021年了，国产片还在拍疼痛青春，还在靠洒狗血圈钱。” 原著作者安妮宝贝也在微博发文：“《八月未央》有诚意靠近原著风格，但是力有不逮，有其明显的局限性。”";
    locationModel3.tageOne = @"安妮宝贝";
    locationModel3.tagTwo = @"";
    locationModel3.isStart = NO;
    locationModel3.isCollted = NO;
    locationModel3.colltecdNum =14;
    locationModel3.joinTime = @"5/1 12:00:00 至 5/5 12:00:00";
    locationModel3.playTime = @"5/8 10:12:00 至 5/15 10:20:00";
    locationModel3.loaction = @"北京市通州区芙蓉园513号楼2至3层";
    locationModel3.phone = @"(010)80850020";
    locationModel3.LoactionID = 3;
    [FilmTempArr addObject:locationModel3];

    
    FilmFactortLoactionModel * locationModel4 =[[FilmFactortLoactionModel alloc]init];
    locationModel4.isBaoming = NO;
    locationModel4.imgArrs = @[@"https://image11.m1905.cn/uploadfile/2021/0423/20210423114209277070.jpg",@"https://image11.m1905.cn/uploadfile/2021/0423/20210423114209886610.jpg",@"https://image11.m1905.cn/uploadfile/2021/0423/20210423114209328063.jpg",@"https://image11.m1905.cn/uploadfile/2021/0423/20210423114212730912.jpg"];
    locationModel4.FilmThubImgView = @"https://image11.m1905.cn/uploadfile/2021/0423/20210423114209277070.jpg";
    locationModel4.title = @"《追虎擒龙》曝预告、海报 古天乐梁家辉黑白交锋";
    locationModel4.titleDesc = @"(黑社会 | 许悦铭)";
    locationModel4.DetailDesc = @"《追虎擒龙》讲述毒枭“跛豪”（梁家辉 饰）和总华探长徐乐（吴镇宇 饰）联手贪污巨利，反腐先锋陈克（古天乐 饰）、白松安（林家栋 饰）决定不惜一切也要将其绳之以法的故事。电影故事背景发生在上世纪七十年代，那时的香港经济飞速发展，但帮派林立，贪腐盛行，混乱之中涌现出一批极具争议性的人物。王晶导演也在此前的采访中表示香港上世纪六七十年代是英国殖民地警黑的混乱状态，自己正值青少年，了解到很多信息，也觉得这是一个非常棒的戏剧题材，一直想拍出来。风云激荡的大时代让电影得以建立极具冲击力的戏剧冲突，传奇人物你方唱罢我登场，看点十足。";
    locationModel4.tageOne = @"跛豪";
    locationModel4.tagTwo = @"";
    locationModel4.isStart = NO;
    locationModel4.isCollted = NO;
    locationModel4.colltecdNum =45;
    locationModel4.joinTime = @"5/1 12:00:00 至 5/5 12:00:00";
    locationModel4.playTime = @"5/10 12:00:00 至 5/12 112:30:00";
    locationModel4.loaction = @"北京市通州区西海子西塔胡同1号";
    locationModel4.phone = @"(010)80850020";
    locationModel4.LoactionID = 4;
    [FilmTempArr addObject:locationModel4];

    

    
    
    BOOL isLoactionModel  = [[NSUserDefaults standardUserDefaults] boolForKey:@"LoactionModel"];
    if (isLoactionModel == NO) {
        BOOL LoactionModel =  [WHC_ModelSqlite inserts:FilmTempArr.copy];
   
        [[NSUserDefaults standardUserDefaults] setBool:LoactionModel forKey:@"LoactionModel"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    }
@end
