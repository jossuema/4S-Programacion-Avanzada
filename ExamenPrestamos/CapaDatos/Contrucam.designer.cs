﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CapaDatos
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="Contrucam")]
	public partial class ContrucamDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertCliente(Cliente instance);
    partial void UpdateCliente(Cliente instance);
    partial void DeleteCliente(Cliente instance);
    partial void InsertMaquinaria(Maquinaria instance);
    partial void UpdateMaquinaria(Maquinaria instance);
    partial void DeleteMaquinaria(Maquinaria instance);
    partial void InsertPrestamo(Prestamo instance);
    partial void UpdatePrestamo(Prestamo instance);
    partial void DeletePrestamo(Prestamo instance);
    #endregion
		
		public ContrucamDataContext() : 
				base(global::CapaDatos.Properties.Settings.Default.ContrucamConnectionString1, mappingSource)
		{
			OnCreated();
		}
		
		public ContrucamDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public ContrucamDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public ContrucamDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public ContrucamDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<Cliente> Clientes
		{
			get
			{
				return this.GetTable<Cliente>();
			}
		}
		
		public System.Data.Linq.Table<Maquinaria> Maquinarias
		{
			get
			{
				return this.GetTable<Maquinaria>();
			}
		}
		
		public System.Data.Linq.Table<Prestamo> Prestamos
		{
			get
			{
				return this.GetTable<Prestamo>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Cliente")]
	public partial class Cliente : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _cedula;
		
		private string _nombre;
		
		private string _apellido;
		
		private int _edad;
		
		private char _sexo;
		
		private EntitySet<Prestamo> _Prestamos;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OncedulaChanging(string value);
    partial void OncedulaChanged();
    partial void OnnombreChanging(string value);
    partial void OnnombreChanged();
    partial void OnapellidoChanging(string value);
    partial void OnapellidoChanged();
    partial void OnedadChanging(int value);
    partial void OnedadChanged();
    partial void OnsexoChanging(char value);
    partial void OnsexoChanged();
    #endregion
		
		public Cliente()
		{
			this._Prestamos = new EntitySet<Prestamo>(new Action<Prestamo>(this.attach_Prestamos), new Action<Prestamo>(this.detach_Prestamos));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_cedula", DbType="VarChar(10) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string cedula
		{
			get
			{
				return this._cedula;
			}
			set
			{
				if ((this._cedula != value))
				{
					this.OncedulaChanging(value);
					this.SendPropertyChanging();
					this._cedula = value;
					this.SendPropertyChanged("cedula");
					this.OncedulaChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_nombre", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string nombre
		{
			get
			{
				return this._nombre;
			}
			set
			{
				if ((this._nombre != value))
				{
					this.OnnombreChanging(value);
					this.SendPropertyChanging();
					this._nombre = value;
					this.SendPropertyChanged("nombre");
					this.OnnombreChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_apellido", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string apellido
		{
			get
			{
				return this._apellido;
			}
			set
			{
				if ((this._apellido != value))
				{
					this.OnapellidoChanging(value);
					this.SendPropertyChanging();
					this._apellido = value;
					this.SendPropertyChanged("apellido");
					this.OnapellidoChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_edad", DbType="Int NOT NULL")]
		public int edad
		{
			get
			{
				return this._edad;
			}
			set
			{
				if ((this._edad != value))
				{
					this.OnedadChanging(value);
					this.SendPropertyChanging();
					this._edad = value;
					this.SendPropertyChanged("edad");
					this.OnedadChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_sexo", DbType="Char(1) NOT NULL")]
		public char sexo
		{
			get
			{
				return this._sexo;
			}
			set
			{
				if ((this._sexo != value))
				{
					this.OnsexoChanging(value);
					this.SendPropertyChanging();
					this._sexo = value;
					this.SendPropertyChanged("sexo");
					this.OnsexoChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Cliente_Prestamo", Storage="_Prestamos", ThisKey="cedula", OtherKey="id_cliente")]
		public EntitySet<Prestamo> Prestamos
		{
			get
			{
				return this._Prestamos;
			}
			set
			{
				this._Prestamos.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Prestamos(Prestamo entity)
		{
			this.SendPropertyChanging();
			entity.Cliente = this;
		}
		
		private void detach_Prestamos(Prestamo entity)
		{
			this.SendPropertyChanging();
			entity.Cliente = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Maquinaria")]
	public partial class Maquinaria : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _codigo;
		
		private string _tipo;
		
		private decimal _tarifa;
		
		private bool _disponible;
		
		private EntitySet<Prestamo> _Prestamos;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OncodigoChanging(string value);
    partial void OncodigoChanged();
    partial void OntipoChanging(string value);
    partial void OntipoChanged();
    partial void OntarifaChanging(decimal value);
    partial void OntarifaChanged();
    partial void OndisponibleChanging(bool value);
    partial void OndisponibleChanged();
    #endregion
		
		public Maquinaria()
		{
			this._Prestamos = new EntitySet<Prestamo>(new Action<Prestamo>(this.attach_Prestamos), new Action<Prestamo>(this.detach_Prestamos));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_codigo", DbType="VarChar(10) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string codigo
		{
			get
			{
				return this._codigo;
			}
			set
			{
				if ((this._codigo != value))
				{
					this.OncodigoChanging(value);
					this.SendPropertyChanging();
					this._codigo = value;
					this.SendPropertyChanged("codigo");
					this.OncodigoChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_tipo", DbType="VarChar(100) NOT NULL", CanBeNull=false)]
		public string tipo
		{
			get
			{
				return this._tipo;
			}
			set
			{
				if ((this._tipo != value))
				{
					this.OntipoChanging(value);
					this.SendPropertyChanging();
					this._tipo = value;
					this.SendPropertyChanged("tipo");
					this.OntipoChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_tarifa", DbType="Decimal(10,2) NOT NULL")]
		public decimal tarifa
		{
			get
			{
				return this._tarifa;
			}
			set
			{
				if ((this._tarifa != value))
				{
					this.OntarifaChanging(value);
					this.SendPropertyChanging();
					this._tarifa = value;
					this.SendPropertyChanged("tarifa");
					this.OntarifaChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_disponible", DbType="Bit NOT NULL")]
		public bool disponible
		{
			get
			{
				return this._disponible;
			}
			set
			{
				if ((this._disponible != value))
				{
					this.OndisponibleChanging(value);
					this.SendPropertyChanging();
					this._disponible = value;
					this.SendPropertyChanged("disponible");
					this.OndisponibleChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Maquinaria_Prestamo", Storage="_Prestamos", ThisKey="codigo", OtherKey="id_maquinaria")]
		public EntitySet<Prestamo> Prestamos
		{
			get
			{
				return this._Prestamos;
			}
			set
			{
				this._Prestamos.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Prestamos(Prestamo entity)
		{
			this.SendPropertyChanging();
			entity.Maquinaria = this;
		}
		
		private void detach_Prestamos(Prestamo entity)
		{
			this.SendPropertyChanging();
			entity.Maquinaria = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Prestamo")]
	public partial class Prestamo : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _codigo;
		
		private string _id_cliente;
		
		private string _id_maquinaria;
		
		private System.DateTime _fecha_entrega;
		
		private System.DateTime _fecha_tentativa;
		
		private System.Nullable<System.DateTime> _fecha_devolucion;
		
		private string _estado;
		
		private EntityRef<Cliente> _Cliente;
		
		private EntityRef<Maquinaria> _Maquinaria;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OncodigoChanging(int value);
    partial void OncodigoChanged();
    partial void Onid_clienteChanging(string value);
    partial void Onid_clienteChanged();
    partial void Onid_maquinariaChanging(string value);
    partial void Onid_maquinariaChanged();
    partial void Onfecha_entregaChanging(System.DateTime value);
    partial void Onfecha_entregaChanged();
    partial void Onfecha_tentativaChanging(System.DateTime value);
    partial void Onfecha_tentativaChanged();
    partial void Onfecha_devolucionChanging(System.Nullable<System.DateTime> value);
    partial void Onfecha_devolucionChanged();
    partial void OnestadoChanging(string value);
    partial void OnestadoChanged();
    #endregion
		
		public Prestamo()
		{
			this._Cliente = default(EntityRef<Cliente>);
			this._Maquinaria = default(EntityRef<Maquinaria>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_codigo", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int codigo
		{
			get
			{
				return this._codigo;
			}
			set
			{
				if ((this._codigo != value))
				{
					this.OncodigoChanging(value);
					this.SendPropertyChanging();
					this._codigo = value;
					this.SendPropertyChanged("codigo");
					this.OncodigoChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id_cliente", DbType="VarChar(10) NOT NULL", CanBeNull=false)]
		public string id_cliente
		{
			get
			{
				return this._id_cliente;
			}
			set
			{
				if ((this._id_cliente != value))
				{
					if (this._Cliente.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.Onid_clienteChanging(value);
					this.SendPropertyChanging();
					this._id_cliente = value;
					this.SendPropertyChanged("id_cliente");
					this.Onid_clienteChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id_maquinaria", DbType="VarChar(10) NOT NULL", CanBeNull=false)]
		public string id_maquinaria
		{
			get
			{
				return this._id_maquinaria;
			}
			set
			{
				if ((this._id_maquinaria != value))
				{
					if (this._Maquinaria.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.Onid_maquinariaChanging(value);
					this.SendPropertyChanging();
					this._id_maquinaria = value;
					this.SendPropertyChanged("id_maquinaria");
					this.Onid_maquinariaChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_fecha_entrega", DbType="Date NOT NULL")]
		public System.DateTime fecha_entrega
		{
			get
			{
				return this._fecha_entrega;
			}
			set
			{
				if ((this._fecha_entrega != value))
				{
					this.Onfecha_entregaChanging(value);
					this.SendPropertyChanging();
					this._fecha_entrega = value;
					this.SendPropertyChanged("fecha_entrega");
					this.Onfecha_entregaChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_fecha_tentativa", DbType="Date NOT NULL")]
		public System.DateTime fecha_tentativa
		{
			get
			{
				return this._fecha_tentativa;
			}
			set
			{
				if ((this._fecha_tentativa != value))
				{
					this.Onfecha_tentativaChanging(value);
					this.SendPropertyChanging();
					this._fecha_tentativa = value;
					this.SendPropertyChanged("fecha_tentativa");
					this.Onfecha_tentativaChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_fecha_devolucion", DbType="Date")]
		public System.Nullable<System.DateTime> fecha_devolucion
		{
			get
			{
				return this._fecha_devolucion;
			}
			set
			{
				if ((this._fecha_devolucion != value))
				{
					this.Onfecha_devolucionChanging(value);
					this.SendPropertyChanging();
					this._fecha_devolucion = value;
					this.SendPropertyChanged("fecha_devolucion");
					this.Onfecha_devolucionChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_estado", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string estado
		{
			get
			{
				return this._estado;
			}
			set
			{
				if ((this._estado != value))
				{
					this.OnestadoChanging(value);
					this.SendPropertyChanging();
					this._estado = value;
					this.SendPropertyChanged("estado");
					this.OnestadoChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Cliente_Prestamo", Storage="_Cliente", ThisKey="id_cliente", OtherKey="cedula", IsForeignKey=true)]
		public Cliente Cliente
		{
			get
			{
				return this._Cliente.Entity;
			}
			set
			{
				Cliente previousValue = this._Cliente.Entity;
				if (((previousValue != value) 
							|| (this._Cliente.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Cliente.Entity = null;
						previousValue.Prestamos.Remove(this);
					}
					this._Cliente.Entity = value;
					if ((value != null))
					{
						value.Prestamos.Add(this);
						this._id_cliente = value.cedula;
					}
					else
					{
						this._id_cliente = default(string);
					}
					this.SendPropertyChanged("Cliente");
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Maquinaria_Prestamo", Storage="_Maquinaria", ThisKey="id_maquinaria", OtherKey="codigo", IsForeignKey=true)]
		public Maquinaria Maquinaria
		{
			get
			{
				return this._Maquinaria.Entity;
			}
			set
			{
				Maquinaria previousValue = this._Maquinaria.Entity;
				if (((previousValue != value) 
							|| (this._Maquinaria.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Maquinaria.Entity = null;
						previousValue.Prestamos.Remove(this);
					}
					this._Maquinaria.Entity = value;
					if ((value != null))
					{
						value.Prestamos.Add(this);
						this._id_maquinaria = value.codigo;
					}
					else
					{
						this._id_maquinaria = default(string);
					}
					this.SendPropertyChanged("Maquinaria");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
