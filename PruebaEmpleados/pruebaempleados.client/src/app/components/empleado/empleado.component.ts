import { Component, OnInit } from '@angular/core';
import { EmpleadoService } from '../../services/empleado.service';
import { ActivatedRoute } from '@angular/router';
import { Empleado } from '../../models/Empleado';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-empleado',
  standalone: false,
  
  templateUrl: './empleado.component.html'
})
export class EmpleadoComponent implements OnInit {
  empleadoId: number = 0;
  empleado: Empleado = { idEmpleado: 0, nombres: '', apellidos: '', identificacion: '', idTipoIdentificacion: 1, nombreTipoId: '' };

  constructor(private empleadoService: EmpleadoService, private route: ActivatedRoute){}
  ngOnInit(): void {
    this.empleado.idTipoIdentificacion = 1;
    this.route.params.subscribe(params => {
      this.empleadoId = parseInt(params['id'], 10); // Convierte el parámetro a entero
      console.log(this.empleadoId);
    })
    if(this.empleadoId == 0){
      return;
    }
    this.getEmpleado()
  }

  getEmpleado(): void {
    this.empleadoService.getEmpleado(this.empleadoId).subscribe(data=> {
      this.empleado = data[0];
      console.log(this.empleado);
    });
  }

  save(): void {
    this.empleadoService.saveEmpleado(this.empleado).subscribe(()=>{
      Swal.fire({
        title: "Empleado guardado exitosamente!",
        icon: "success",
      });
    });
  }

}
