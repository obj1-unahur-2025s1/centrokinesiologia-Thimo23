class Paciente{
  const edad
  var fortalezaMuscular
  var nivelDolor

  method esMayorDe(reestriccionDeEdad) = edad > reestriccionDeEdad
  method tieneNivelInferior(restriccionDolor) = restriccionDolor > nivelDolor
  method usarAparato(unAparato) = unAparato.usar(self)
  method fortalezaMuscular() = fortalezaMuscular
  method nivelDolor() = nivelDolor 

  method reducirDolor(dolor){
    if(dolor < 1){nivelDolor -= nivelDolor * dolor} //considero porcentaje de esta manera, para que complicarse profe.
    else {nivelDolor = nivelDolor - dolor}
    return 0.max(nivelDolor)
    } 
  method fortalecer(aumentoFortaleza){
    if(aumentoFortaleza < 1 and aumentoFortaleza > 0){fortalezaMuscular += edad * aumentoFortaleza}
    if(aumentoFortaleza > 1){fortalezaMuscular += aumentoFortaleza}

    return fortalezaMuscular
  }      
}
class Aparato{
    method puedeUsarElAparato(unPaciente)
    method usar(unPaciente)
}
class Magneto inherits Aparato{
 override method puedeUsarElAparato(unPaciente) = true
 override method usar(unPaciente) {
   if(self.puedeUsarElAparato(unPaciente)){
     unPaciente.reducirDolor(0.1)
   }
 }
}
class Bicicleta inherits Aparato{
 const restriccionEdad = 8   
 override method puedeUsarElAparato(unPaciente) = unPaciente.esMayorDe(restriccionEdad)
 override method usar(unPaciente){
    if(self.puedeUsarElAparato(unPaciente)){
        unPaciente.reducirDolor(4)
        unPaciente.fortalecer(3)
    }
 }
}
class Minitramp inherits Aparato{
 const restriccionDolor = 20
 override method puedeUsarElAparato(unPaciente) = unPaciente.tieneNivelInferior(restriccionDolor)
 override method usar(unPaciente){
    if(self.puedeUsarElAparato(unPaciente)){
        unPaciente.fortalecer(0.1)
    }
 }   
}