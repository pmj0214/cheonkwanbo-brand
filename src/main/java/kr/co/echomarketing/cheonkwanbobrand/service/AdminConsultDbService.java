package kr.co.echomarketing.cheonkwanbobrand.service;

import kr.co.echomarketing.cheonkwanbobrand.domain.AdminCodeDb;
import kr.co.echomarketing.cheonkwanbobrand.domain.AdminConsultDb;
import kr.co.echomarketing.cheonkwanbobrand.domain.AdminSearchParam;
import kr.co.echomarketing.cheonkwanbobrand.enums.ConsultDbList;
import kr.co.echomarketing.cheonkwanbobrand.mapper.AdminMapper;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.List;

@Service
public class AdminConsultDbService {

    @Autowired
    private AdminMapper adminMapper;

    public List<AdminConsultDb> consultDbListView(AdminSearchParam adminSearchParam) {
        return adminMapper.findByDbList(adminSearchParam);
    }

    public Integer consultDbListCount(AdminSearchParam adminSearchParam) {
        return adminMapper.countByDbList(adminSearchParam);
    }

    public void consultDbExport(HttpServletResponse res, AdminSearchParam adminSearchParam, Object userAuth, String fileName) {
        List<AdminConsultDb> consultDbs = adminMapper.findByDbList(adminSearchParam);
        List<String> headers = ConsultDbList.HEADER.authHeader(userAuth);
//        CreateCsv createCsv = new CreateCsv(consultDbs, userAuth);
//        return createCsv.make();
         // 메모리에 100개의 행을 유지합니다. 행의 수가 넘으면 디스크에 적습니다.
         SXSSFWorkbook wb = new SXSSFWorkbook(100);
         Sheet sheet = wb.createSheet();

        try {
            Row header = sheet.createRow(0);
            Cell headerCell = null;
            for (int i = 0; i < headers.size(); i++) {
                headerCell = header.createCell(i);
                headerCell.setCellValue(headers.get(i));
            }

            for (int i = 0; i < consultDbs.size(); i++) {
                Row row = sheet.createRow(i+1);
                Cell cell = null;
                for (int j = 0; j < headers.size(); j++) {
                    cell = row.createCell(j);
                    if ("번호".equals(headers.get(j))) {
                        cell.setCellValue(consultDbs.get(i).getIdx());
                    } else if ("중복여부".equals(headers.get(j))) {
                        cell.setCellValue(consultDbs.get(i).isDuplicate());
                    } else {
                        String value = consultDbs.get(i).get(headers.get(j)).toString();
                        cell.setCellValue(value);
                    }
                }
            }

            res.setHeader("Set-Cookie", "fileDownload=true; path=/");
            res.setHeader("Content-Disposition", String.format("attachment; filename=\"".concat(fileName).concat("\"")));
            wb.write(res.getOutputStream());
        } catch (Exception e)  {
            res.setHeader("Set-Cookie", "fileDownload=false; path=/");
            res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            res.setHeader("Content-Type","text/html; charset=utf-8");

            OutputStream out = null;
            try {
                out = res.getOutputStream();
                byte[] data = new String("예기치 않는 오류가 발생하였습니다.").getBytes();
                out.write(data, 0, data.length);
            } catch(Exception ignore) {
                ignore.printStackTrace();
            } finally {
                if(out != null) try { out.close(); } catch(Exception ignore) {}
            }

        } finally {
            // 디스크 적었던 임시파일 제거
             wb.dispose();
             try {
                wb.close();
             } catch(Exception ignore) {
             }
        }

    }

}
