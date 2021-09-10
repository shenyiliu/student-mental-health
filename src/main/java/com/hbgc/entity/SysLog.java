package com.hbgc.entity;

public class SysLog {

    private Integer id; // id

    private String username; // 当前访问的用户

    private String url; // 访问的网址

    private String ip; // 访问的ip

    private String method; // 请求的方法

    private String visitTime; // 访问的时间

    private Long times; // 访问响应时长

    public SysLog() {
        super();
    }

    public SysLog(Integer id, String username, String url, String ip, String method, String visitTime, Long times) {
        super();
        this.id = id;
        this.username = username;
        this.url = url;
        this.ip = ip;
        this.method = method;
        this.visitTime = visitTime;
        this.times = times;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getVisitTime() {
        return visitTime;
    }

    public void setVisitTime(String visitTime) {
        this.visitTime = visitTime;
    }

    public Long getTimes() {
        return times;
    }

    public void setTimes(Long times) {
        this.times = times;
    }

    @Override
    public String toString() {
        return "SysLog [id=" + id + ", username=" + username + ", url=" + url + ", ip=" + ip + ", method=" + method
                + ", visitTime=" + visitTime + ", times=" + times + "]";
    }

}
