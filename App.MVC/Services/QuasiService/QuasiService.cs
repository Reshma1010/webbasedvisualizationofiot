using App.DAL.DBContext;
using App.DAL.Models;
using App.MVC.ViewModels;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Data;
using System.Diagnostics;
using System.Runtime.Intrinsics.Arm;

namespace App.MVC.Services.QuasiService
{
    public class QuasiService
    {
        private readonly IConfiguration _configuration;
        public QuasiService(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public SensorVM GetByID(int ID)
        {
            try
            {
                using (var _dbContext = new MiddlewareContext())
                {
                    var data = _dbContext.Sensors.FirstOrDefault(x => x.IdSensor == ID);
                    if (data != null)
                    {
                        return new SensorVM
                        {
                            Id = (int)data.IdSensor,
                            SerialNumber = data.SensorSerialNumber,
                            Designation = data.SensorDesignation,
                            Active = data.Active,
                            Remark = data.Remark,
                            FloorNo = data.FloorNo,
                            RoomNo = data.RoomNo,
                            Xheight = data.Xheight,
                            YWidth  = data.YWidth,
                        };
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return new SensorVM();
        }
        public List<SensorVM> GetAllSensor()
        {
            List<SensorVM> sensorList = new List<SensorVM>();
            try
            {
                string connectionString = _configuration.GetConnectionString("ConnectionString");
                using (SqlConnection con = new SqlConnection(connectionString))
                {

                    var cmd = new SqlCommand("GET_ALL_SENSOR", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        sensorList.Add(new SensorVM
                        {
                            Id = Convert.ToInt32(rdr["Id"]),
                            SerialNumber = Convert.ToString(rdr["SerialNumber"]),
                            Designation = Convert.ToString(rdr["Designation"]),
                            Active = Convert.ToBoolean(rdr["Active"]),
                            Remark = Convert.ToString(rdr["Remark"]),
                            SensorDevice = Convert.ToString(rdr["SensorDevice"]),
                            FloorNo = rdr["FloorNo"] != DBNull.Value ? Convert.ToInt32(rdr["FloorNo"]) : null,
                            RoomNo = rdr["RoomNo"] != DBNull.Value ? Convert.ToInt32(rdr["RoomNo"]) : null
                        });
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return sensorList;
        }
        public List<QuasiVM> GetSensorData(int id)
        {
            List<QuasiVM> quasiList = new List<QuasiVM>();
            try
            {
                string connectionString = _configuration.GetConnectionString("ConnectionString");
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("GET_RECENT_STATUS", con);
                    cmd.Parameters.Add("@SENSOR_ID", SqlDbType.Int).Value = id;
                    cmd.Parameters.Add("@NUM", SqlDbType.Int).Value = 1000;
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        QuasiVM quasi = new QuasiVM
                        {
                            Sensor_Id = Convert.ToString(rdr["Sensor_Id"]),
                            Record_Id = Convert.ToInt32(rdr["Record_Id"]),
                            Sensor_Date = Convert.ToDateTime(rdr["Sensor_Date"]),
                            Value = Convert.ToDecimal(rdr["Value"]),
                            Data_Type = Convert.ToString(rdr["Data_Type"]),
                            Unit = Convert.ToString(rdr["Unit"]),
                            Sensor_Name = Convert.ToString(rdr["Sensor_Name"]),
                            Location = Convert.ToString(rdr["Location"])
                        };
                        quasiList.Add(quasi);
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {

            }
            return quasiList;
        }
        public List<QuasiVM> GetSensorDataByDate(string from,string to,int id)
        {
            List<QuasiVM> quasiList = new List<QuasiVM>();
            try
            {
                string connectionString = _configuration.GetConnectionString("ConnectionString");
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("GET_SENSOR_DATA", con);
                    cmd.Parameters.Add("@FROM", SqlDbType.NVarChar,200).Value = from;
                    cmd.Parameters.Add("@TO", SqlDbType.NVarChar, 200).Value = to;
                    cmd.Parameters.Add("@SENSOR_ID", SqlDbType.Int).Value = id;
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        QuasiVM quasi = new QuasiVM
                        {
                            Sensor_Id = Convert.ToString(rdr["Sensor_Id"]),
                            Record_Id = Convert.ToInt32(rdr["Record_Id"]),
                            Sensor_Date = Convert.ToDateTime(rdr["Sensor_Date"]),
                            Value = Convert.ToDecimal(rdr["Value"]),
                            Data_Type = Convert.ToString(rdr["Data_Type"]),
                            Unit = Convert.ToString(rdr["Unit"]),
                            Sensor_Name = Convert.ToString(rdr["Sensor_Name"])
                        };
                        quasiList.Add(quasi);
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {

            }
            return quasiList;
        }
        public int AssignRoomToSensor(int roomNo, int sensorId)
        {
            try
            {
                RoomInfo roomInfo = new RoomInfo();
                using(var _dbContext=new MiddlewareContext())
                {
                    var sensors = _dbContext.Sensors.Where(x => x.RoomNo == roomNo).ToList();
                    roomInfo = _dbContext.RoomInfos.FirstOrDefault(x=>x.RooomName==roomNo)!;
                    if(sensors.Count < roomInfo!.SensorCapacity)
                    {
                        var data = _dbContext.Sensors.FirstOrDefault(x => x.IdSensor == sensorId);
                        if (data != null)
                        {
                            data.RoomNo = roomNo;
                            data.FloorNo = Convert.ToInt32(roomNo.ToString().Substring(0, 1));
                            _dbContext.Update(data);
                            _dbContext.SaveChanges();
                            return 1;
                        }
                    }
                    else
                    {
                        return 2;
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return 0;
        }
        public int UnassignRoomToSensor(int sensorId)
        {
            try
            {
                using (var _dbContext = new MiddlewareContext())
                {
                    var data = _dbContext.Sensors.FirstOrDefault(x => x.IdSensor == sensorId);
                    if (data != null)
                    {
                        data.RoomNo = null;
                        data.FloorNo = null;
                        _dbContext.Update(data);
                        _dbContext.SaveChanges();
                        return 1;
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return 0;
        }
        public int UpdateCoordinates(int sensorId, int XHeight, int YWidth)
        {
            try
            {
                using (var _dbContext = new MiddlewareContext())
                {
                    var data = _dbContext.Sensors.FirstOrDefault(x => x.IdSensor == sensorId);
                    if (data != null)
                    {
                        data.Xheight = XHeight;
                        data.YWidth = YWidth;
                        _dbContext.Update(data);
                        _dbContext.SaveChanges();
                        return 1;
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return 0;
        }
    }
}
