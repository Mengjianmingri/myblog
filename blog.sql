DROP TABLE rxz_article;;/*SkipError*/
CREATE TABLE rxz_article(
                            id INT(10) NOT NULL AUTO_INCREMENT  COMMENT '文章表' ,
                            article_categoryID INT(10) NOT NULL   COMMENT '文章分类' ,
                            article_title VARCHAR(128) NOT NULL   COMMENT '文章标题' ,
                            article_context VARCHAR(1024) NOT NULL   COMMENT '文章内容' ,
                            article_publish DATE NOT NULL   COMMENT '文章发表时间' ,
                            article_info VARCHAR(128)    COMMENT '文章简介' ,
                            article_clicked INT(10) NOT NULL   COMMENT '文章阅读次数' ,
                            article_authorID INT NOT NULL   COMMENT '文章作者' ,
                            PRIMARY KEY (id)
) COMMENT = '文章表 ';;

ALTER TABLE rxz_article COMMENT '文章表';;
CREATE TABLE rxz_articleCategory(
                                    id INT NOT NULL AUTO_INCREMENT  COMMENT '文章分类表主键' ,
                                    category_name VARCHAR(32) NOT NULL   COMMENT '分类名称' ,
                                    category_info VARCHAR(128)    COMMENT '此分类描述' ,
                                    PRIMARY KEY (id)
) COMMENT = '文章分类表 ';;

ALTER TABLE rxz_articleCategory COMMENT '文章分类表';;
CREATE TABLE rxz_friends(
                            id INT NOT NULL AUTO_INCREMENT  COMMENT '好友表主键' ,
                            author_id INT NOT NULL   COMMENT '作者id' ,
                            friend_id INT NOT NULL   COMMENT '好友id' ,
                            info VARCHAR(128)    COMMENT '备注' ,
                            PRIMARY KEY (id)
) COMMENT = '好友数据表 ';;

ALTER TABLE rxz_friends COMMENT '好友数据表';;
DROP TABLE rxz_images;;/*SkipError*/
CREATE TABLE rxz_images(
                           id INT NOT NULL AUTO_INCREMENT  COMMENT '图片表主键' ,
                           addr VARCHAR(1024) NOT NULL   COMMENT '图片路径' ,
                           upload_date DATE NOT NULL   COMMENT '上传日期' ,
                           upload_userId INT NOT NULL   COMMENT '上传者' ,
                           info VARCHAR(32)    COMMENT '描述' ,
                           PRIMARY KEY (id)
) COMMENT = '图片信息表 ';;

ALTER TABLE rxz_images COMMENT '图片信息表';;
DROP TABLE rxz_user;;/*SkipError*/
CREATE TABLE rxz_user(
                         id INT NOT NULL AUTO_INCREMENT  COMMENT '用户id' ,
                         usernamre VARCHAR(32) NOT NULL   COMMENT '用户名' ,
                         sex INT NOT NULL   COMMENT '性别' ,
                         PRIMARY KEY (id,usernamre)
) COMMENT = '用户表 ';;

ALTER TABLE rxz_user COMMENT '用户表';;
DROP TABLE rxz_review;;/*SkipError*/
CREATE TABLE rxz_review(
                           id INT NOT NULL AUTO_INCREMENT  COMMENT '评论主键' ,
                           article_id INT NOT NULL   COMMENT '被评论的文章id' ,
                           speaker_id INT NOT NULL   COMMENT '当前评论发布者' ,
                           preSpeaker_id INT NOT NULL   COMMENT '当前评论对象id' ,
                           context VARCHAR(1024) NOT NULL   COMMENT '评论内容' ,
                           review_time DATE NOT NULL   COMMENT '评论发布时间' ,
                           PRIMARY KEY (id)
) COMMENT = '评论表 ';;

ALTER TABLE rxz_review COMMENT '评论表';;


ALTER TABLE rxz_images
    ADD FOREIGN KEY (upload_userId)
        REFERENCES rxz_user(id);
ALTER TABLE rxz_friends
    ADD FOREIGN KEY (author_id)
        REFERENCES rxz_user(id);
ALTER TABLE rxz_friends
    ADD FOREIGN KEY (friend_id)
        REFERENCES rxz_user(id);
ALTER TABLE rxz_review
    ADD FOREIGN KEY (speaker_id)
        REFERENCES rxz_user(id);
ALTER TABLE rxz_review
    ADD FOREIGN KEY (preSpeaker_id)
        REFERENCES rxz_user(id);
ALTER TABLE rxz_review
    ADD FOREIGN KEY (article_id)
        REFERENCES rxz_article(id);
ALTER TABLE rxz_article
    ADD FOREIGN KEY (article_authorID)
        REFERENCES rxz_user(id);
ALTER TABLE rxz_article
    ADD FOREIGN KEY (article_categoryID)
        REFERENCES rxz_articleCategory(id);
insert into rxz_articleCategory values (1,'文学','包括古典、现代、外国文学');
