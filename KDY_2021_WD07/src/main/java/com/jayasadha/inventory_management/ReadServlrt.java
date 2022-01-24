package com.jayasadha.inventory_management;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ReadServlrt")
public class ReadServlrt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ITName = request.getParameter("iname");
		String ITPrice = request.getParameter("iprice");
		String ITImage = request.getParameter("iimage");
		String ItemID = request.getParameter("iitid");
		String ItemBrand = request.getParameter("iitbrand");
		String ItemCategory = request.getParameter("iitcategory");
		
		
		boolean istrue;
	
		
		istrue =ShopDButil.Insert(ITName, ITPrice,ITImage,ItemID, ItemBrand, ItemCategory);
		
		

		if(istrue == true) {

			
			List<Shop> shopdetails = ShopDButil.getid(); 
			request.setAttribute("shopdetails", shopdetails); 
			
			//dispatcher to request to success.jsp
			RequestDispatcher dis = request.getRequestDispatcher("Shoplist.jsp");
			dis.forward(request, response);
			
		}

		
		else {
			
			//dispatcher to request to unsuccess.jsp
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
			}
	}

}
