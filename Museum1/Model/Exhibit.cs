//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Museum1.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Exhibit
    {
        public int ID_Exhibit { get; set; }
        public string Name { get; set; }
        public Nullable<int> ID_Hall { get; set; }
    
        public virtual Hall Hall { get; set; }
    }
}
