import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Empleado } from '../models/Empleado';

@Injectable({
  providedIn: 'root',
})
export class EmpleadoService {
  private apiUrl: string = 'https://localhost:4200/empleado';
  constructor(private httpClient: HttpClient) {}

  getEmpleados(): Observable<Empleado[]> {
    return this.httpClient.get<Empleado[]>(this.apiUrl);
  }
  getEmpleado(id:number): Observable<Empleado[]> {
    return this.httpClient.get<Empleado[]>(`${this.apiUrl}/${id}`);
  }

  deleteEmpleado(id: number): Observable<any> {
    console.log(this.apiUrl + '/' + id);
    return this.httpClient.delete(`${this.apiUrl}/${id}`);
  }

  saveEmpleado(empleado: Empleado): Observable<any> {
    return this.httpClient.post(this.apiUrl, empleado);
  }
}
