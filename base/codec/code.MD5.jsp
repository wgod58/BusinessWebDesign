<%@page pageEncoding="utf-8" import="java.security.MessageDigest"%><%

    public String encodeMD5(byte[]message) {
    	try {
    		MessageDigest messageDigest = (MessageDigest)MessageDigest.getInstance("MD5").clone();
    		messageDigest.reset();
    		messageDigest.update(message);
    		byte[]mdbytes = messageDigest.digest();
    		StringBuffer hexString = new StringBuffer();
    		for (int i = 0; i < mdbytes.length; i++) {
    			String hex = Integer.toHexString(0xff & mdbytes[i]);
    			if (hex.length() == 1) {
    				hexString.append('0');
    			}
    			hexString.append(hex);
    		}
    		return hexString.toString();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return null;
    }
    public String getMD5(String srcText) {
    	Cache cache = getApplicationCache();
    	String md5 = (String)cache.get("MD5:" + srcText);
    	if (md5 == null) {
    		md5 = encodeMD5(srcText.getBytes());

    		if (srcText.length() > 10240)
    			cache.put("MD5:" + srcText, md5, 60000); //資料過大時，僅暫存1分鐘
    		else
    			cache.put("MD5:" + srcText, md5, 3600000);
    	}
    	return md5;
    }

%>