<%@page pageEncoding="utf-8" import="java.io.ByteArrayOutputStream,java.util.zip.Deflater,java.util.zip.Inflate"%><%

    public byte[] compress(byte[] data) {
        try {
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream(data.length);
            Deflater deflater = new Deflater();
            deflater.setLevel(Deflater.BEST_COMPRESSION);
            deflater.setInput(data);
            deflater.finish();
            byte[] buffer = new byte[1024];
            while (!deflater.finished()) {
                int count = deflater.deflate(buffer); // returns the generated code... index
                outputStream.write(buffer, 0, count);
            }
            outputStream.close();
            deflater.end();
            return outputStream.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public byte[] decompress(byte[] data) {
        try {
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream(data.length);
            Inflater inflater = new Inflater();
            inflater.setInput(data);
            byte[] buffer = new byte[1024];
            while (!inflater.finished()) {
                int count = inflater.inflate(buffer);
                outputStream.write(buffer, 0, count);
            }
            outputStream.close();
            inflater.end();
            return outputStream.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
%>