<%@page pageEncoding="utf-8" import="java.util.regex.*,java.io.*,java.util.*"%><%

    public String readPuSrcFile(String file) {
        Cache puFileCache = getApplicationCache();
        String puFileKey = "PU:" + file;
        String puFileContent = (String) puFileCache.get(puFileKey);
        if (puFileContent != null) {
            return puFileContent;
        }

        BufferedReader reader = null;
        StringBuilder content = new StringBuilder();
        try {
            reader = new BufferedReader(new InputStreamReader(new FileInputStream(file), "UTF-8"));
            String text = null;
            while ((text = reader.readLine()) != null) {
                content.append(text);
                content.append("\r\n");
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (Exception e) {}
            }
        }
        puFileContent = content.toString();
        if (puFileContent.length() > 0) {
            puFileCache.put(puFileKey, puFileContent, 4000); //暫存4秒
        }
        return puFileContent;
    }

    public String processPuFile(JSONObject obj) {
        response.setContentType("text/html; charset=utf-8");
        String puContent = readPuSrcFile(request.getServletContext().getRealPath(request.getServletPath() + ".pu"));
        String puPattern = URLDecoder.decode("%3C%25%3D%28%5B%5E%25%5D%2B%29%25%3E");
        Pattern pattern = Pattern.compile(puPattern);
        Matcher matcher = pattern.matcher(puContent);
        JSONObject vars = new JSONObject();
        while (matcher.find()) {
            vars.put(matcher.group(0), matcher.group(1));
        }
        Iterator it = vars.keys();
        while (it.hasNext()) {
            try {
                String k = (String)(it.next());
                String v = null;
                try {
                    v = obj.getString(vars.getString(k));
                } catch (Exception e) {}

                if (v == null) {
                    v = k;
                }
                puContent = puContent.replaceAll(Pattern.quote(k), v);
            } catch (Exception e) {}
        }
        return puContent;
    }
%>