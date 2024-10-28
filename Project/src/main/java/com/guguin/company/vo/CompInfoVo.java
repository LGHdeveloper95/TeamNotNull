package com.guguin.company.vo;

public class CompInfoVo {
    private String comid;
    private String title;
    private String content;
    private String history;
    private String people_num;
    private String link;
    private String image_path;

    // Getters and Setters
    public String getComid() { return comid; }
    public void setComid(String comid) { this.comid = comid; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getHistory() { return history; }
    public void setHistory(String history) { this.history = history; }

    public String getPeople_num() { return people_num; }
    public void setPeopleNum(String people_Num) { this.people_num = people_Num; }

    public String getLink() { return link; }
    public void setLink(String link) { this.link = link; }

    public String getImage_path() { return image_path; }
    public void setImagePath(String imagePath) { this.image_path = imagePath; }
}
