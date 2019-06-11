package cl.model;

import cl.model.Categoria;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-06-10T22:54:02")
@StaticMetamodel(Producto.class)
public class Producto_ { 

    public static volatile SingularAttribute<Producto, Integer> precio;
    public static volatile SingularAttribute<Producto, String> nomproducto;
    public static volatile SingularAttribute<Producto, Categoria> idcategoria;
    public static volatile SingularAttribute<Producto, Integer> stock;
    public static volatile SingularAttribute<Producto, Integer> idproducto;

}