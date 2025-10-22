package model;

import java.io.Serializable;
import java.util.Objects;

public class ModelTelefone implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String numero;
	
	private ModelLogin usuario_pai_fk;
	private ModelLogin usuario_cad_fk;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public ModelLogin getUsuario_pai_fk() {
		return usuario_pai_fk;
	}
	public void setUsuario_pai_fk(ModelLogin usuario_pai_fk) {
		this.usuario_pai_fk = usuario_pai_fk;
	}
	public ModelLogin getUsuario_cad_fk() {
		return usuario_cad_fk;
	}
	public void setUsuario_cad_fk(ModelLogin usuario_cad_fk) {
		this.usuario_cad_fk = usuario_cad_fk;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(id, numero, usuario_cad_fk, usuario_pai_fk);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ModelTelefone other = (ModelTelefone) obj;
		return Objects.equals(id, other.id) && Objects.equals(numero, other.numero)
				&& Objects.equals(usuario_cad_fk, other.usuario_cad_fk)
				&& Objects.equals(usuario_pai_fk, other.usuario_pai_fk);
	}
	
}
