﻿namespace App.MVC.ViewModels
{
    public class GeneralResponseModel
    {
        public bool Success { get; set; }
        public string? Message { get; set; }
        public object? Result { get; set; }
    }
}
