<%@page pageEncoding="utf-8" import="java.security.MessageDigest"%><%
    
    public String encodeSHA256(byte[] message) {
        try {
            MessageDigest messageDigest = (MessageDigest)MessageDigest.getInstance("SHA-256").clone();
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
%>