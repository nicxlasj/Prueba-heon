import { Component } from '@angular/core';
import { EmpleadoService } from '../../services/empleado.service';
import { Empleado } from '../../models/Empleado';
import { faTrash } from '@fortawesome/free-solid-svg-icons';
import { faPlus } from '@fortawesome/free-solid-svg-icons';
import { faPenToSquare } from '@fortawesome/free-solid-svg-icons';
import Swal from 'sweetalert2';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  standalone: false,
  templateUrl: './home.component.html',
})
export class HomeComponent {
  lstEmpleados: Empleado[] = [];
  constructor(
    private empleadoService: EmpleadoService,
    private router: Router
  ) {}
  name: string = '';

  ngOnInit(): void {
    this.getEmpleados();
  }

  filterByName(name: string): void {
    if (name === '') {
      this.getEmpleados();
    }
    let filtrado = this.lstEmpleados.filter((x) => x.nombres.includes(name));
    console.log(filtrado);
    this.lstEmpleados = filtrado;
  }

  getEmpleados(): void {
    this.empleadoService.getEmpleados().subscribe((data) => {
      this.lstEmpleados = data;
      console.log(data);
    });
  }

  deleteEmpleado(id: number): void {
    Swal.fire({
      title: '¿Estas seguro que quieres eliminar este empleado?',
      showDenyButton: true,
      confirmButtonText: 'No, volver al listado',
      denyButtonText: `Sí, estoy seguro`,
    }).then((result) => {
      if (result.isConfirmed) {
        return;
      } else if (result.isDenied) {
        try {
          this.empleadoService.deleteEmpleado(id).subscribe((data) => {
            this.getEmpleados();
          });
        } catch (error) {
          Swal.fire('Ha ocurrido un error :/', '', 'error');
        }
        Swal.fire('Empleado eliminado exitosamente', '', 'success');
      }
    });
  }

  redirect(id?: number): void {
    if (id === undefined) this.router.navigate(['/front/empleado/0']);
    else {
      this.router.navigate(['/front/empleado/' + id]);
    }
  }

  faTrash = faTrash;
  faPlus = faPlus;
  faPenToSquare = faPenToSquare;
  title = 'pruebaempleados.client';
}
