package kr.bit.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileAddController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String UPLOAD_DIR = "file_repo";
		String uploadPath = request.getServletContext().getRealPath("") + File.separator  // window: \\, linux : /
				+ UPLOAD_DIR;
		File currentDirPath = new File(uploadPath);  // 파일을 업로드할 경로를 File객체로 만들기
		if(!currentDirPath.exists()) {
			currentDirPath.mkdir();
		}
		
		// 파일을 업로드할 때 먼저 저장될 임시 저장경로를 설정
		// file upload시 필요한 API : commons-fileupload, commons-io
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currentDirPath);
		factory.setSizeThreshold(1024*1024);
		
		String fileName = null;
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			// request안에 여러개의 파일이 업로드된 경우
			// items -> FileItem[], FileItem[], FileItem[],...
			List<FileItem> items = upload.parseRequest(request);
			
			for(int i=0; i<items.size(); i++) {
				FileItem fileItem = items.get(i);
				if(fileItem.isFormField()) {  // 폼필드이면
					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString("utf-8"));
				}else {  // 파일이면 업로드
					if(fileItem.getSize() > 0) {
						int idx = fileItem.getName().lastIndexOf("\\");  // window
						if(idx == -1 ) {
							idx = fileItem.getName().lastIndexOf("/");  //linux
						}
						fileName = fileItem.getName().substring(idx+1);
						File uploadFile = new File(currentDirPath + "\\" + fileName);
						// 파일 중복 체크
						if(uploadFile.exists()) {
							fileName = System.currentTimeMillis() + "_" + fileName;
							uploadFile = new File(currentDirPath + "\\" + fileName);
						}
						
						fileItem.write(uploadFile);  // 임시경로 -> 새로운 경로에 파일 쓰기
					}
				}
			}  // for_end
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		// $.ajax()쪽으로 업로드된 최종 파일이름을 전송시켜 준다.
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(fileName);
		
		return null;
	}

}
