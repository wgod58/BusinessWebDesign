<%@page pageEncoding="utf-8" import="java.security.MessageDigest,java.text.*,java.util.Date,java.nio.ByteBuffer"%><%
%><%@include file="/base/web/code.getCookieObj.jsp"%><%
%><%@include file="/base/codec/code.Obfuscate_XOR.jsp"%><%
%><%@include file="/base/codec/code.CheckCode_XOR.jsp"%><%
%><%@include file="/base/codec/code.Base64.jsp"%><%
%><%@include file="/base/codec/code.MD5.jsp"%><%

    public String getMD5(String srcText){
        Cache cache = getApplicationCache();
        String md5 = (String)cache.get("MD5:"+srcText);
        if(md5 == null){
            md5 = encodeMD5(srcText.getBytes());
            cache.put("MD5:"+srcText, md5, 3600000);
        }
        return md5;
    }

    public boolean checkCode(String key, String code){
        //String key = "B8jL1A";
        // B8jL1A2014080109=>bd85d6978633c494676df273ae9df73a
        // B8jL1A2014102914=>8eeefd77ac1ab5f3260ab7ffa35a4c37
        // B8jL1A2014102915=>0b146500ba80c90b84eb98e5ff40e727
        // B8jL1A2014102916=>2a0c6c110ad4f1ec2c24d873562d465d
        String md5;
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHH");
		df.setTimeZone(java.util.TimeZone.getTimeZone("UTC"));
        Date now = new Date();
		code = code.toLowerCase();
        md5 = getMD5(key + df.format(now.getTime()));
        if(code.equals(md5)){
            return true;
        }
        md5 = getMD5(key + df.format(now.getTime()-3600000));
        if(code.equals(md5)){
            return true;
        }
        md5 = getMD5(key + df.format(now.getTime()+3600000));
        if(code.equals(md5)){
            return true;
        }
        return false;
    }

    public boolean checkVerify(String verify){
        try{
            byte[] c = decodeBase64(verify);
            byte[] b = decodeCheckCode(c);
            byte[] a = decodeObfuscate(b);
            ByteBuffer buffer = ByteBuffer.allocate(Long.SIZE/Byte.SIZE);
            buffer.put(a);
            buffer.flip();
            long dueTime = buffer.getLong();
            Date now = new Date();
            if(now.getTime() < dueTime){
                return true;
            }
        }catch(Exception e){
        }
        return false;
    }

    public String genVerify(){
        Date now = new Date();
        long dueTime = now.getTime() + (86400000*6); //6天
        ByteBuffer buffer = ByteBuffer.allocate(Long.SIZE/Byte.SIZE);
        buffer.putLong(dueTime);
        byte[] a = buffer.array();
        byte[] b = encodeObfuscate(a);
        byte[] c = encodeCheckCode(b);
        return encodeBase64URLSafeString(c);
    }

    public boolean doCodeVerify(String key){
        try{
            String code = getParameter("code");
            if(checkCode(key, code)){
                javax.servlet.http.Cookie cookie = new javax.servlet.http.Cookie("verify", genVerify());
                response.addCookie(cookie);
            }else{
                JSONObject cookieObj = getCookieObj();
                String verify = cookieObj.getString("verify");
                if(checkVerify(verify) == false){
                    return false;
                }
            }
        }catch(Exception e){
            return false;
        }
        return true;
    }
%>