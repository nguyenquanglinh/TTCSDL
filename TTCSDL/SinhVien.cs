using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TTCSDL
{
   public class SinhVien
    {
        public SinhVien()
        {
            this.MaSV = null;
            this.Name = null;
            this.Khoa = null;
            this.NgaySinh = "null";
            this.GioiTinh = "null";
            this.DiaChiHT = "null";
            this.QueQuan = "null";
            this.GhiChu = "null";
            this.IdLop = null;
            this.SoTCDK = "null";
            this.SoTCDD = "null";
            this.SoTCTL = "null";
        }
        public SinhVien(string maSv,string name,string khoa):this()
        {
            this.MaSV = maSv;
            this.Name = name;
            this.Khoa = khoa;
        }

        public bool CheckSvNotNull()
        {
            return MaSV != null && Name != null && Khoa != null;
        }

        public string Infor()
        {
            return  MaSV+" " + Name + " "
                + NgaySinh + " " + GioiTinh + " "
                + QueQuan + " " + DiaChiHT + " "
                + Khoa + " " +  IdLop + " "
                + SoTCDK + " " + SoTCDD + " " + SoTCTL + " " + GhiChu;
        }
        public override string ToString()
        {
            return "Mã sinh viên: "+MaSV+"/nTên sinh viên: "+Name
                +"/nNgày sinh: "+NgaySinh+"/nGiới tính: "+GioiTinh
                +"/nQuê quán: "+QueQuan+"/nĐịa chỉ hiện tại: "+DiaChiHT
                +"/nKhoaDky: "+Khoa+"\nIdLop: "+IdLop
                +"/nSố tc dk: "+SoTCDK+"/nsố tcdd: "+SoTCDD+"/nsố tctl: "+SoTCTL
                +"/nGhiChu: "+GhiChu;
        }

        public string DiaChiHT { get;  set; }
        public string GhiChu { get;  set; }
        public string GioiTinh { get;  set; }
        public string IdLop { get;  set; }
        public string Khoa { get;  set; }
        public string MaSV { get;  set; }
        public string Name { get;  set; }
        public string NgaySinh { get;  set; }
        public string QueQuan { get;  set; }
        public string SoTCDK { get;  set; }
        public string SoTCTL { get;  set; }
        public string SoTCDD { get;  set; }
    }
}
