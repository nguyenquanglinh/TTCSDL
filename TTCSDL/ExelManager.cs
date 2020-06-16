using Microsoft.Office.Interop.Excel;
using System;
using System.Collections.Generic;
using System.Drawing;

namespace TTCSDL
{
    public class ExelManager
    {
        public static bool XuatDSSV(List<SinhVien>dssv)
        {
            try
            {
                string saveExcelFile = @"C:\Users\thang\Source\Repos\TTCSDL\TTCSDL\DataExcel\DanhSachSinhVien.xlsx";

                Microsoft.Office.Interop.Excel.Application xlApp = new Microsoft.Office.Interop.Excel.Application();

                if (xlApp == null)
                {
                    return false;
                }
                xlApp.Visible = false;

                object misValue = System.Reflection.Missing.Value;

                Workbook wb = xlApp.Workbooks.Add(misValue);

                Worksheet ws = (Worksheet)wb.Worksheets[1];

                if (ws == null)
                {
                    return false;
                }
                int row = 1;
                string fontName = "Times New Roman";
                int fontSizeTieuDe = 18;
                int fontSizeTenTruong = 14;
                int fontSizeNoiDung = 12;
                //Xuất dòng Tiêu đề của File báo cáo:tên trường
                Range row1_TieuDeTenTruong = ws.get_Range("D1", "J1");
                row1_TieuDeTenTruong.Merge();
                row1_TieuDeTenTruong.Font.Size = fontSizeTieuDe;
                row1_TieuDeTenTruong.Font.Name = fontName;
                row1_TieuDeTenTruong.Cells.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignLeft;
                row1_TieuDeTenTruong.Value2 = "HỌC VIỆN KỸ THUẬT QUÂN SỰ";
                row1_TieuDeTenTruong.Interior.Color = ColorTranslator.ToOle(System.Drawing.Color.YellowGreen);
                //phòng đào tạo
                Range row1_TieuDePhongDaoTao = ws.get_Range("D2", "J2");
                row1_TieuDePhongDaoTao.Merge();
                row1_TieuDePhongDaoTao.Font.Size = fontSizeTieuDe-2;
                row1_TieuDePhongDaoTao.Font.Name = fontName;
                row1_TieuDePhongDaoTao.Cells.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignLeft;
                row1_TieuDePhongDaoTao.Value2 = "          PHÒNG ĐÀO TẠO";
                row1_TieuDePhongDaoTao.Interior.Color = ColorTranslator.ToOle(System.Drawing.Color.YellowGreen);

                //tiêu đề danh sách sinh viên
                Range row1_TieuDePDSSV = ws.get_Range("D3", "J3");
                row1_TieuDePDSSV.Merge();
                row1_TieuDePDSSV.Font.Size = fontSizeTieuDe - 2;
                row1_TieuDePDSSV.Font.Name = fontName;
                row1_TieuDePDSSV.Cells.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                row1_TieuDePDSSV.Value2 = "Danh sách sinh viên toàn trường";
                row1_TieuDePDSSV.Interior.Color = ColorTranslator.ToOle(System.Drawing.Color.Yellow);

                //Tạo Ô Số Thứ Tự(STT)

                Range row23_STT = ws.get_Range("D5");//Cột A dòng 2 và dòng 3
                row23_STT.Merge();
                row23_STT.Font.Size = fontSizeTenTruong;
                row23_STT.Font.Name = fontName;
                row23_STT.Cells.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                row23_STT.Value2 = "STT";
                row23_STT.ColumnWidth += 10;
                row23_STT.Interior.Color = ColorTranslator.ToOle(System.Drawing.Color.LightGray);

                //Tạo HỌ TÊN :
                Range row23_HoTen = ws.get_Range("E5");//Cột B dòng 2 và dòng 3
                row23_HoTen.Merge();
                row23_HoTen.Font.Size = fontSizeTenTruong;
                row23_HoTen.Font.Name = fontName;
                row23_HoTen.Cells.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                row23_HoTen.Value2 = "Họ và tên";
                row23_HoTen.ColumnWidth += 30;
                row23_HoTen.Interior.Color = ColorTranslator.ToOle(System.Drawing.Color.LightGray);
                //Tạo Ô ngày  sinh :
                Range row23_NgaySinh = ws.get_Range("F5");//Cột C dòng 2 và dòng 3
                row23_NgaySinh.Merge();
                row23_NgaySinh.Font.Size = fontSizeTenTruong;
                row23_NgaySinh.Font.Name = fontName;
                row23_NgaySinh.Cells.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                row23_NgaySinh.Value2 = "Ngày sinh";
                row23_NgaySinh.ColumnWidth += 20;
                row23_NgaySinh.Interior.Color = ColorTranslator.ToOle(System.Drawing.Color.LightGray);

                //Tạo Ô giới tính :
                Range row2_GioiTinh = ws.get_Range("G5");//Cột D->E của dòng 2
                row2_GioiTinh.Merge();
                row2_GioiTinh.Font.Size = fontSizeTenTruong;
                row2_GioiTinh.Font.Name = fontName;
                row2_GioiTinh.Cells.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                row2_GioiTinh.Value2 = "Giới tính";
                row2_GioiTinh.ColumnWidth+= 10;
                row2_GioiTinh.Interior.Color = ColorTranslator.ToOle(System.Drawing.Color.LightGray);
                //tạo ô quê quán
                Range row2_QueQuan = ws.get_Range("H5");
                row2_QueQuan.Merge();
                row2_QueQuan.Font.Size = fontSizeTenTruong;
                row2_QueQuan.Font.Name = fontName;
                row2_QueQuan.Cells.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                row2_QueQuan.Value2 = "Quê quán";
                row2_QueQuan.ColumnWidth += 30;
                row2_QueQuan.Interior.Color = ColorTranslator.ToOle(System.Drawing.Color.LightGray);
                //tạo ô chỗ ở hiện tại
                Range row2_ChoOHT = ws.get_Range("I5");//Cột D->E của dòng 2
                row2_ChoOHT.Merge();
                row2_ChoOHT.Font.Size = fontSizeTenTruong;
                row2_ChoOHT.Font.Name = fontName;
                row2_ChoOHT.Cells.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                row2_ChoOHT.Value2 = "Đia chỉ hiện tại";
                row2_ChoOHT.ColumnWidth += 30;
                row2_ChoOHT.Interior.Color = ColorTranslator.ToOle(System.Drawing.Color.LightGray);
                //tạo ô chỗ ghi chú
                Range row2_GhiChu = ws.get_Range("J5");//Cột D->E của dòng 2
                row2_GhiChu.Merge();
                row2_GhiChu.Font.Size = fontSizeTenTruong;
                row2_GhiChu.Font.Name = fontName;
                row2_GhiChu.Cells.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                row2_GhiChu.Value2 = "Ghi chú";
                row2_GhiChu.ColumnWidth += 30;
                row2_GhiChu.Interior.Color = ColorTranslator.ToOle(System.Drawing.Color.LightGray);
                //Tô nền vàng các cột tiêu đề:
                //  Range row23_CotTieuDe = ws.get_Range("A2", "E3");
                //nền vàng
                //   row23_CotTieuDe.Interior.Color = ColorTranslator.ToOle(System.Drawing.Color.Yellow);
                //in đậm
                //   row23_CotTieuDe.Font.Bold = true;
                //chữ đen
                //S   row23_CotTieuDe.Font.Color = ColorTranslator.ToOle(System.Drawing.Color.Black);

                int stt = 1;
                row = 6;//dữ liệu xuất bắt đầu từ dòng số 4 trong file Excel (khai báo 3 để vào vòng lặp nó ++ thành 4)
               
                foreach (var  sp in dssv)
                {
                    dynamic[] arr = { stt, sp.Name, sp.NgaySinh, sp.GioiTinh, sp.QueQuan,sp.DiaChiHT,sp.GhiChu };
                    Range rowData = ws.get_Range("D" + row, "J" + row);//Lấy dòng thứ row ra để đổ dữ liệu
                    rowData.Font.Size = fontSizeNoiDung;
                    rowData.Font.Name = fontName;
                    rowData.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                    rowData.Interior.Color = ColorTranslator.ToOle(System.Drawing.Color.LightGray);
                    rowData.Value2 = arr;
                    stt++;
                    row++;
                }
                //Kẻ khung toàn bộ
                BorderAround(ws.get_Range("D1", "J" + row));

                //Lưu file excel xuống Ổ cứng
                wb.SaveAs(saveExcelFile);

                //đóng file để hoàn tất quá trình lưu trữ
                wb.Close(true, misValue, misValue);
                //thoát và thu hồi bộ nhớ cho COM
                xlApp.Quit();
                releaseObject(ws);
                releaseObject(wb);
                releaseObject(xlApp);
                //Mở File excel sau khi Xuất thành công
             //   System.Diagnostics.Process.Start(saveExcelFile);
            }
            catch
            {
            }
            return false;
        }

        private static void releaseObject(object obj)
        {
            try
            {
                System.Runtime.InteropServices.Marshal.ReleaseComObject(obj);
                obj = null;
            }
            catch
            {
                obj = null;
            }
            finally
            {
                GC.Collect();
            }
        }
        private static void BorderAround(Range range)
        {
            Borders borders = range.Borders;
            borders[XlBordersIndex.xlEdgeLeft].LineStyle = XlLineStyle.xlContinuous;
            borders[XlBordersIndex.xlEdgeTop].LineStyle = XlLineStyle.xlContinuous;
            borders[XlBordersIndex.xlEdgeBottom].LineStyle = XlLineStyle.xlContinuous;
            borders[XlBordersIndex.xlEdgeRight].LineStyle = XlLineStyle.xlContinuous;
            borders.Color = Color.Black;
            borders[XlBordersIndex.xlInsideVertical].LineStyle = XlLineStyle.xlContinuous;
            borders[XlBordersIndex.xlInsideHorizontal].LineStyle = XlLineStyle.xlContinuous;
            borders[XlBordersIndex.xlDiagonalUp].LineStyle = XlLineStyle.xlLineStyleNone;
            borders[XlBordersIndex.xlDiagonalDown].LineStyle = XlLineStyle.xlLineStyleNone;
        }
    }
}
